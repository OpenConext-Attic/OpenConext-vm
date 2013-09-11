-- enable the admin client on APIS for SAML
REPLACE INTO client_attributes(client_id , attribute_name, attribute_value) values
  (99998, 'CLIENT_SAML_ENTITY_NAME','https://apis._OPENCONEXT_DOMAIN_/client/client.html');
  
-- insert cruncher related items
REPLACE INTO resourceserver (id, contactEmail,  contactName, resourceServerName, resourceServerKey, secret, owner, thumbNailUrl)
    VALUES (99990, 'admin@example.com','admin','Cruncher','cruncher', 'cruncher-secret', 'urn:collab:person:example.com:admin', '');
    
    -- insert CSA related items
REPLACE INTO resourceserver (id, contactEmail,  contactName, resourceServerName, resourceServerKey, secret, owner, thumbNailUrl)
    VALUES (99980, 'admin@example.com','admin','CSA','csa', 'csa-secret', 'urn:collab:person:example.com:admin', '');