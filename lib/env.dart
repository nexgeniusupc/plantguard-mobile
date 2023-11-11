const _apiAuthorityKey = 'API_AUTHORITY';
const _apiBaseKey = 'API_BASE';

const apiAuthority = String.fromEnvironment(
  _apiAuthorityKey,
  defaultValue: bool.fromEnvironment('dart.vm.product')
      ? 'plantguard-api-staging.dalbitresb.com'
      : 'localhost:8787',
);

const apiBase = String.fromEnvironment(_apiBaseKey, defaultValue: '/api/v1');
