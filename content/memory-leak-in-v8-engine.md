---
title: "Memory Leak in V8 Engine"
date: 2018-06-04T17:45:20+08:00
---

Recently, I found [a memory leak in nodejs](https://github.com/nodejs/node/issues/21021). Here is how I found it.

There was a docker container keep being killed by docker due to exceeding of memory limitation.
I know the this node script don't need that much memory, so I simply reduce the heap size by `--max-old-space-size=100m`.
I hope by doing this either the gc will be triggered early or the script will crash with out of memory.

But neither of them happend.

Then I ran the script locally, watch the memory by `ps aux`. And the memory is leaking with `--max-old-space-size=40m`.
Immediately I thought it was a bug in nodejs. After upgrading nodejs to v9.10.1 the bug disappeared.

Searching google with nodejs v8 memory leak gave me nothing. I also search the commit logs of nodejs and v8. But nothing helped.

Next week, by dumping `process.memoryUsage()`, I found it's the external memory is leaking.
And also by running node with `--trace-gc`, the node v9 has more frequent mark-compact.

Then I started gdb it to trace how gc triggered. Finally, I found the bug and the fixing commit.
I have seen this commit when I search the commit logs. But I didn't recognize it, this might because lacking of 
the context of the commit. When I search the commit logs I don't what is scavenge, what is mark-compact, and even don't know what is a external memory.

Other thing should noticed is that why I didn't print `process.memoryUsage()` early. I thought one reason is because I was holding a wrong memory model in my mind.
Which is v8's memory is construct by only new space and old space and both of them are heap. But in fact, they should be new space, old space and external.
I was assuming wrong things at the beginning of debugging.

And other reason is that I was thinking from the point of a user. From the point of a user, I don't want to know how does it work and how did the developers built it.
But when I start debugging this issue I switch to the role developer of the nodejs and v8.
And by thinking in that way, I should easily guessing that there should be a way to dump logs and memory usage.
