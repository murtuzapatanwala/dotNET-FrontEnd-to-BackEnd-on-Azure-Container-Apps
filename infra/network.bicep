param location string
param resourceToken string
param tags object

var abbrs = loadJsonContent('abbreviations.json')

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: '${abbrs.networkVirtualNetworks}${name}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: '${abbrs.networkVirtualNetworksSubnets}${name}'
        properties: {
          addressPrefix: '10.0.0.0/23'
        }
      }
      {
        name: '${abbrs.networkVirtualNetworksSubnets}${networkApplicationGateways}${name}'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}
