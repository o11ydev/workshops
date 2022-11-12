---
title: "Metrics Monitoring"
description: "Querying Prometheus"
repo: ""
tags: []
type: docs
weight: 10
draft: false
---

Metrics monitoring is different because it does not assume that a situation can
be explained in fixed states. Instead, it brings you inside your system and
provides dozens of metrics that you can then analyze and understand.

Even if you do not need all the metrics, it is better to collect them to look
further what they look like.

## What is a metric

- **Name**
- Timestamp
- Labels
- **Value**
- Type

### Labels

Labels are used to add metadata to metrics. That can be used to differenciate
then, e.g. by adding a status code, a URI handler, a function name, ...

### Types of metrics

Gauge
: Metric that can go up and down

Counters
: Metric that can only go up and starts at 0

Histograms
: Metrics that put data into buckets. An histogram is composed of 3 metrics:
sum, buckets and count.

Summaries
: Metrics that calculate quantiles over observed values. A summary is composed
of 3 metrics: sum, quantiles and count.

[Upstream documentation](https://prometheus.io/docs/concepts/metric_types/)

### Exercises

The number of http requests is expressed in ...

The duration in ...

The number of active sessions is a ...

What are the labels added by prometheus ?

What are the labels prometheus knows but does not add?

## promlens

Promlens helps you build and understand queries.

1. Download [promlens](https://prometheus.io/download/) {{% version "promlens" %}}.
1. Extract it

    ```shell
    $ tar xvf Downloads/promlens-{{% version "promlens" %}}.linux-amd64.tar.gz
    ```

1. List the files

    ```shell
    $ ls promlens-{{% version "promlens" %}}.linux-amd64
    ```

1. Launch the node_exporter

    ```shell
    $ cd promlens-{{% version "promlens" %}}.linux-amd64
    $ ./promlens --web.default-prometheus-url="http://127.0.0.1:9090"
    ```

1. Open your browser at [http://127.0.0.1:8080](http://127.0.0.1:8080)
1. Add your promlens and your neighbors to prometheus.

---

## Labels matching

For prometheus to do calculations and comparisons of metrics, labels must match
one each side (except `__name__`, the name of the metric)

---

## Maths

Operators like `+`, `-`, `*`, `/`, ...

## Aggregators

- `count()`
- `sum()`

## Functions

Some important functions:

- `rate()`
- `deriv()`
- `delta()`
- `increase()`

In the list above, which ones should be used with counters, and which ones with
gauges?


What is the difference between irate and rate? idelta and delta?

---

## Aggregation

How can I get the sum of scraped metrics by job (2 ways)? -- exclusion and
inclusion.

{{% alert title="Tip" color="primary" %}}
The `scrape_samples_scraped` metric is added by prometheus after sraping a
target and indicates the number of metrics for that job at that scrape.
{{% /alert %}}

{{% hidden "Solution" %}}
Using by:
```
sum(scrape_samples_scraped) by (job)
```

Using without:
```
sum(scrape_samples_scraped) without (instance)
```
{{% /hidden %}}

How can I get the % of `handler="/federate"` over the other
`prometheus_http_request_duration_seconds_count` ?

{{% hidden "Solution" %}}
```
100 *
rate(prometheus_http_request_duration_seconds_count{handler="/federate"}[5m])
/ ignoring(handler) group_right sum without (handler)
(rate(prometheus_http_request_duration_seconds_count[5m]))
```
{{% /hidden %}}

---

## Over Time

What is the difference between `max` and `max_over_time`?

---

## Max, Min, Bottomk, Topk

What is the difference between `max(x)` and `topk(1, x)`?

---

## Time functions

`day()`

`day_of_week()`

How to use the optional argument of `day_of_week`?

What is the `timestamp()` function? How can it be useful?

{{% alert title="Tip" color="info" %}}
You can use Grafana Explore feature to get help and autocomplete on
Prometheus (currently still a "beta" feature). That feature will likely
come in the next release of Prometheus!
{{% /alert %}}

## And/Or

Can you think of any usecases for `and`/`or`/`unless`?
