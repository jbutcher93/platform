fn process_request(request) {
  let claims = request.context[Router.APOLLO_AUTHENTICATION_JWT_CLAIMS];
  if claims == () {
    throw #{
      status: 401
    };
  };
  // Add each claim key-value pair as a separate HTTP header.
  // Note that that claims that are not present in the JWT will be added as empty strings.
  // TODO: uncomment sourceId when it's included and add sourceId to claim_names

  let claim_names = ["mpid", "sourceId", "consumerId", "email", "iss"];
  for claim_name in claim_names {
    let claim = claims[claim_name];
    claim = if claim == () {""} else {claim};
      request.subgraph.headers[claim_name] = claim;
  };
  let mpn = request.subgraph.headers["mpid"];
  if mpn == "" {
    log_error("Error: mpn not present in token");
    throw #{
      status: 400,
      message: "token missing marketing program number"
  };
  };
  let consumer_id = request.subgraph.headers["consumerId"];
  if consumer_id == "" {
    log_error("Error: consumerID not present in token");
    throw #{
      status: 400,
      message: "token missing consumerID"
  };
  };
  let source_id = request.subgraph.headers["sourceId"];
  if source_id == "" {
    log_error("Error: sourceID not present in token");
    throw #{
      status: 400,
      message: "token missing sourceID"
  };
  };
}