# Contributing

👍🎉 If you’re here to contribute to this project: thanks for taking the time! 🎉👍

The following is a set of guidelines for contributing to this project.
The goal is to make things go more smoothly. If you think that's not the case, feel free to propose changes.


## Bug reports

If you find a bug or a documentation issue, please [report](https://github.com/dexidp/helm-charts/issues/new?assignees=&labels=kind%2Fbug&template=bug_report.md) it or even better: fix it.

Read on to learn more about submitting changes.


## Feature requests

If you think a feature is missing, please [report](https://github.com/dexidp/helm-charts/issues/new?assignees=&labels=kind%2Fenhancement&template=feature_request.md) it or even better: implement it.

If you report it, please describe your use case concretely and with as much details as possible.
Hiding details behind abstractions makes it harder to understand the problem.

If you decide to take a stab at implementing the feature,
read the rest of this guide to learn more about submitting changes.


## Opening a pull request

The project accepts changes in the form of pull requests (or PRs).
Pull requests allow maintainers to properly review the patch before accepting it
and lets the CI ([GitHub Actions](https://docs.github.com/en/actions)) run automated checks to make sure the proposed change doesn't break anything.

If you are new to GitHub or the concept of pull requests, check out the [official GitHub documentation](https://help.github.com/articles/about-pull-requests/).


### Prerequisites

First of all, you are going to need [Helm](https://helm.sh/docs/intro/install/) in order to test your changes.
You can find the currently used version in the [.tool-versions](https://github.com/dexidp/helm-charts/blob/master/.tool-versions) file at the root of this repository.

Alternatively, you can use [asdf](https://asdf-vm.com/) to install the right version.

You will also need a Kubernetes cluster to test your changes.
One option is using [kind](https://kind.sigs.k8s.io/) and installing the updated chart in a local cluster.
An alternative is using a managed Kubernetes provider, like [DigitalOcean](https://www.digitalocean.com/).


### Forking the repository

Fork the project on [GitHub](https://github.com/dexidp/helm-charts) by clicking on the _Fork_ button in the right upper corner and clone the repository:

```bash
git clone git@github.com:YOURNAME/helm-charts.git
cd helm-charts
git remote add upstream https://github.com/dexidp/helm-charts.git
git fetch upstream
```

### Making changes

You are ready to make changes to a chart.

Start by creating a new branch:

```bash
git checkout -b my-branch -t upstream/master
```

Each pull request should contain changes for a single chart, unless it's a systematic change affecting all or multiple charts.

If you would like to submit breaking changes, please open an issue first to discuss them with the maintainers.


#### Adding variables to `values.yaml`

Changes often involve adding new variables to `values.yaml`.
If that is the case, please follow the documentation pattern found in `values.yaml` files:

```yaml
# -- This line documents some variable.
# Optional line to link to API references or other places that describe this variable in more detail.
someVariable: 12
```

Variables often enable/disable certain features based on a default nil value.
In that case the variable should still be added to the `values.yaml` file so that it can appear in the generated documentation:

```yaml
# -- (int) This variable has a default nil.
# Notice the variable type above: it hints the documentation generator to use the correct type.
someOtherVariable:
```

For additional `values.yaml` best practices check out the [official Helm documentation](https://helm.sh/docs/chart_best_practices/values/).


### Testing

Once you are ready with your changes, make sure they pass the linter:

```bash
helm lint charts/CHART
```

Next, you should install the chart to a Kubernetes cluster to make sure your changes don't break existing functionality:

> **Pro tip:** Create a `values.test.yaml` in the chart directory (don't worry: they are in gitignore).

```bash
helm upgrade --install -f charts/CHART/values.test.yaml my-chart-test charts/CHART
```

Delete the release from the cluster once you made sure that your changes work:

```bash
helm delete my-chart-test
```

Repeat the test with your feature disabled to make sure the default happy path isn't broken either.


### Commiting the changes

Try to keep your changes grouped logically within individual commits.
It's easier for maintainers to review changes that way.

Once you are done with your changes and testing, commit your changes:

```bash
git add charts/CHART/
git commit -m 'feat(charts/CHART): add feature X'
```


#### Commit message guidelines

A good commit message should describe what changed and why.
This project uses [Conventional Commits](https://www.conventionalcommits.org/) to structure commit messages.
In the future, commit messages might help automating the release process (eg. automatic chart version bumps).

Examples of commit messages following Conventional Commits:

- `fix(charts/CHART): chart repo url points to the right location`
- `feat(charts/CHART): add external secret`
- `docs(charts/CHART): add note about private GKE clusters`

Note the added `charts/CHART` context in the commit message: it signals which chart is affected.

Please look at the [Conventional Commits site](https://www.conventionalcommits.org/) for more examples and details.


### Updating `Chart.yaml`

After all changes are done, you need to update the `Chart.yaml` file in the chart.

TODO


### Regenerating documentation

TODO


### Opening the pull request

TODO


## Versioning policy

TODO

## Change log

TODO
