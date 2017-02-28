<!-- 
Jordan Levine 
9.1
Release 0 Research

What are some common HTTP status codes?

SUCCESS codes:
200 means OK - the request succeeded
302 and 307 - found but temporarily at a different URL; keep using the same URL
304 - the document has not been modified - used when client send a conditional GET request

ERROR codes:
300 - means that the requested resource has different choices and can't be resolved into one.
301 - means moved permanently
400 - means bad syntax used
401 - means unauthorized - the request must include an acceptable WWW-Authenticate header field
403 - means forbidden - don't repeat, and authorization won't help
404 - URL not found
410 - Gone - requested resource is no longer available at the server, no forwarding address known
500 - internal server error
501 - not implemented - the server does not support functionality required to fulfill request (server may  not recognize request method)
503 - service unavailable - web server can't handle your request at this time
550 - permission denied - account you are logged into does not have permission to perform attempted action - you may be trying to upload to the wrong directory or trying to delete a file


What is the difference between a GET request and a POST request? When might each be used?
GET requests data from a specified resource, while POST submits data to a specified resource. You might use a GET if you need to load on the client an image, an HTML document, a Javascript .js file or a .css stylesheet. It might also be used if you need to get some data from a database from the server to the client. You might use a POST if the user entered some data that needs to be sent to the server to be stored in the database, processed, etc.

GET is not as safe and should never be used for sensitive data - this is because a)the data is included in the URL, b) the data remains in browser history, c) data can be cached, and d) it can be bookmarked. POST has none of these behaviors. Other differences include: a) GET allows only ASCII characters, while POST has no restrictions, b) GET has length restrictions (2048 chars total for URL), while POST does not, and c) nothing happens with a GET when the user reloads the page or presses the back button; with POST, the data will be resubmitted (a warning to the user should be given)

What is a cookie and how does it relate to HTTP requests?
A cookie is a small piece of data (name/value pair) stored on a user's computer and used by the web browser. They can store stateful information such as shopping cart items, browsing activity, or form field information. Each time a request is made to the server, the cookie information is sent to the server.
Some types of cookies:
a. Authentication cookies let web servers know if the user is logged in and with which account so that it can know if it can send sensitive data or require authentication first. 
2. Secure cookies may only be transmitted over HTTPS (encrypted connection) and has a Secure flag. 
3. A session cookie (has no expiration date) is deleted by the browser when it is closed. 
4. A persistent cookie expires at a specify date or after a specific length of time - as long as it is alive, the cookie will transmit information to the server every time the user visits the website.
Cookies can be set by the server using the Set-Cookie HTTP header in an HTTP response from the server; they can also be set by a Javascript program on the client, but only if the cookie's HttpOnly flag is not set. -->