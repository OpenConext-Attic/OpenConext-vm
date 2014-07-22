-- enable the admin client on APIS for SAML
REPLACE INTO client_attributes(client_id , attribute_name, attribute_value) values
  (99998, 'CLIENT_SAML_ENTITY_NAME','https://apis._OPENCONEXT_DOMAIN_/client/client.html');
  
-- insert cruncher related items
REPLACE INTO resourceserver (id, contactEmail,  contactName, resourceServerName, resourceServerKey, secret, owner, thumbNailUrl)
    VALUES (99990, 'admin@example.com','admin','Cruncher','cruncher', 'cruncher-secret', 'urn:collab:person:example.com:admin', '');
REPLACE INTO client (id, contactEmail, contactName, description, clientName, resourceserver_id, clientId, secret, allowedClientCredentials)
    VALUES
    (99980, 'client@integration.tests.surfnet', 'john.doe', 'credentials for the integration test suite of SURF',
    'integration-test-client', 99990, 'cruncher-integrationtest-client', '862eb6c0-4ca5-4f34-8f9d-5bd727dd697d', 1);
    
-- insert CSA related items
REPLACE INTO resourceserver (id, contactEmail,  contactName, resourceServerName, resourceServerKey, secret, owner, thumbNailUrl)
    VALUES (99980, 'admin@example.com','admin','CSA','csa', 'csa-secret', 'urn:collab:person:example.com:admin', '');
REPLACE INTO ResourceServer_scopes values (99980, 'cross-idp-services'),(99980, 'actions'),(99980, 'stats');
REPLACE INTO client (id, contactEmail, contactName, description, clientName, resourceserver_id, clientId, secret, allowedClientCredentials)
VALUES
    (99978, 'client@integration.tests.surfnet', 'john.doe', 'credentials for the integration test suite of SURF',
    'integration-test-client', 99980, 'csa-integrationtest-client', 'ba1d6668-32d8-4ac8-a15f-fbfa07c1bb74', 1);
INSERT INTO Client_scopes values (99978, 'cross-idp-services'), (99978, 'actions'),(99978, 'stats');

-- insert dashboard related items
REPLACE INTO client (id, contactEmail, contactName, description, clientName, resourceserver_id, clientId, secret, allowedClientCredentials)
VALUES
    (99970, 'dashboard@_OPENCONEXT_DOMAIN_', 'john.doe', 'credentials for dashboard',
    'dashboard-csa-client', 99980, 'dashboard-csa-client', '70c2d0ef-1848-4cfb-b9e1-d69bba442cdf', 1);
INSERT INTO Client_scopes values (99970, 'cross-idp-services'), (99970, 'actions'),(99970, 'stats');
REPLACE INTO client (id, contactEmail, contactName, description, clientName, resourceserver_id, clientId, secret, allowedClientCredentials)
VALUES
    (99960, 'dashboard@_OPENCONEXT_DOMAIN_', 'john.doe', 'credentials for dashboard',
    'dashboard-cruncher-client', 99990, 'dashboard-cruncher-client', '7ff37fe7-161c-4f71-bb8f-8c9ad0f23ee3', 1);
