param location string
param resourceToken string


var abbrs = loadJsonContent('abbreviations.json')

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: '${abbrs.networkVirtualNetworks}${resourceToken}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: '${abbrs.networkVirtualNetworksSubnets}${resourceToken}'
        properties: {
          addressPrefix: '10.0.0.0/23'
        }
      }
      {
        name: '${abbrs.networkVirtualNetworksSubnets}${networkApplicationGateways}${resourceToken}'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}
