# gitlab-cookbook

Super simple cookbook to deploy Gitlab.

## Supported Platforms

Ubuntu

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['gitlab']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### gitlab::default

Include `gitlab` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[gitlab::default]"
  ]
}
```

## License and Authors

Author:: Edmund Haselwanter (<YOUR_EMAIL>)
