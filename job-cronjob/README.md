### Jobs & CronJobs
Most of the time, you are using Kubernetes as a platform to run "long" processes where their purpose is to serve responses for a given incoming request.

But Kubernetes also lets you run processes that their purpose is to execute some logic (i.e. update database, batch processing, …​) and die.

Kubernetes Jobs are tasks that execute some logic once.

Kubernetes CronJobs are Jobs that are repeated following a Cron pattern.