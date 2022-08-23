import requests as r

#
# def management(request):
#     management_url = 'https://django-rest-api.us.auth0.com/api/v2/'
#
#     request_token_url = 'https://django-rest-api.us.auth0.com/oauth/token'
#     headers = {'content-type': 'application/json'}
#     payload = '{"client_id":"YQnrMDwuUxul4E6YmQtvWHgS283lMN4Y",' \
#               '"client_secret":"fX-FO7C77Vs5sGC9WjA2WmMjZIoeaALWD0xc9gFuofsjXtRf90xfZKDP7BfC9dg_",' \
#               f'"audience":"{management_url}",' \
#               '"grant_type":"client_credentials"}'
#
#     response = r.post(url=request_token_url, headers=headers, data=payload)
#
#     data = response.json()
#     token = response.json()['access_token']
#     print(token)
#
#     if request.method == 'GET':
#         data = f'{management_url}/users'
#
#
#
# management()
