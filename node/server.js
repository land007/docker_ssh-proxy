const pty = require('pty.js');
const strip_ansi = require('strip-ansi');//npm install strip-ansi@6.0.0

const SSHIP = process.env['SSHIP'] || '192.168.1.1';
const SSHPORT = process.env['SSHPORT'] || '22';
const USERNAME = process.env['USERNAME'] || 'land007';
const PASSWORD = process.env['PASSWORD'] || '1234567';
const PROXYIP = parseInt(process.env['PROXYIP'] || '172.17.0.1');
const PROXYPORT = parseInt(process.env['PROXYPORT'] || '8000');

const term = pty.spawn('bash', [], {
	name: 'xterm-color',
	cols: 80,
	rows: 30,
	cwd: process.env.HOME,
	env: process.env
});

term.on('data', function(data) {
	//console.log(Buffer.from(data).toString('base64'));
	data = strip_ansi(data)
	process.stdout.write(data);
	if (data.endsWith('\r\n') || data.endsWith('$ ') || data.endsWith('# ') || data.endsWith('password: ')) {
		// if(data.endsWith('$ ') || data.endsWith('# ')) {
		// }
		if (data.endsWith(':~# ')) {
			term.write('ssh -p ' + SSHPORT + ' -R 127.0.0.1:' + (PROXYPORT + 1) + ':' + PROXYIP + ':' + PROXYPORT + ' -o StrictHostKeyChecking=no ' + USERNAME + '@' + SSHIP + '\r');
		} else if (data.endsWith('~]# ')) {
			term.write('ssh -p ' + SSHPORT + ' -N -L 0.0.0.0:' + PROXYPORT + ':127.0.0.1:' + (PROXYPORT + 1) + ' -o StrictHostKeyChecking=no ' + USERNAME + '@127.0.0.1\r');
		} else if (data.endsWith('password: ')) {
			term.write(PASSWORD + '\r');
		} else {
		}
	}
	//  console.log(data);
});

//term.resize(100, 40);
term.write('ls /\r');

//console.log(term.process);