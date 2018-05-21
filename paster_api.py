'''
A basic server sending commands to paster
'''

from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer

from subprocess import check_output, STDOUT

PORT = 8000


def paster(cmd):
    cmd = 'ckan-paster --plugin=ckan {0}'.format(cmd)
    try:
        return check_output(cmd, stderr=STDOUT, shell=True)
    except Exception as e:
        return str(e)


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.wfile.write('CKAN Paster service ready')

    def do_POST(self):
        size = int(self.headers['Content-Length'])
        cmd = self.rfile.read(size).strip()
        result = paster(cmd)
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(result)


httpd = HTTPServer(('', PORT), Handler)
print('Starting HTTP server at port %d' % PORT)
try:
    httpd.serve_forever()
except KeyboardInterrupt:
    pass
httpd.server_close()