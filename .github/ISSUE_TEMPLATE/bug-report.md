name: 🐛 Report a bug
about: Report a bug, crash, mistake or unintended behaviour. Please file a seperate report for each problem.
title: Add a descriptive title
labels: bug
assignees: srnyx

body:
  - type: markdown
    attributes:
      value: |
        Before reporting a bug here, please make sure you use the latest version of the template from the [Actions page](https://github.com/srnyx/mc-server-templates/actions).
        Additionally, please join [srnyx's World](https://srnyx.xyz/discord) and open a ticket via the #support channel with your issue so that we can confirm that it is a bug.
  - type: textarea
    attributes:
	  label: General discription
	  description: Please provide a general description of what happened.
	validations:
	  required: true
  - type: textarea
    attributes:
      label: Expected behavior
      description: What behavior of the template do you expect?
    validations:
      required: true
  - type: textarea
    attributes:
      label: Actual behavior
      description: How does the template actually react?
    validations:
      required: true
  - type: textarea
    attributes:
      label: Steps to reproduce
      description: Can the behavior be reproduced consistently? If yes, how? Please also attach screenshots and/or [server logs](https://mclo.gs/) if they could help to understand the problem.
    validations:
      required: true
  - type: checkboxes
    attributes:
      label: Affected templates
      description: "Please select which templates are affected by this bug/issue."
      options:
        - label: Fabric 1.16.5
          required: false
        - label: Fabric 1.17.1
          required: false
        - label: Fabric 1.18.1
          required: false
        - label: Paper 1.8.8
          required: false
        - label: Purpur 1.16.5
          required: false
        - label: Purpur 1.17.1
          required: false
        - label: Purpur 1.18.1
          required: false
  - type: checkboxes
    attributes:
      label: Checks
      description: "To help us avoid \"solving\" the same problems over and over, please check the following points before submitting:"
      options:
        - label: I am __not__ using an outdated version of the template.
          required: true
        - label: I asked in [srnyx's World](https://srnyx.xyz/discord) to see whether this issue is in fact a bug that needs to be fixed.
          required: true
  - type: textarea
    attributes:
      label: Additional information
      description: |
        If you can think of anything else that might help us, there's plenty of room for it here. 😉
    validations:
      required: false