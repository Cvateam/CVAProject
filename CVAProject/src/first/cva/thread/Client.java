package first.cva.thread;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class Client {
	public static Socket socket;
	public String data;

	public void startClient() {
		Thread thread = new Thread() {
			@Override
			public void run() {
				try {
					socket = new Socket("localhost", 5001);
					System.out.println("연결완료: " + socket.getRemoteSocketAddress());
				} catch (Exception e) {
					System.out.println("접속종료");
					if (!socket.isClosed()) {
						stopClient();
					}
					return;
				}
				receive();
			}
		};
		thread.start();
	}

	public void stopClient() {
		try {
			System.out.println("연결끊음");
			if (socket != null && !socket.isClosed()) {
				socket.close();
			}
		} catch (Exception e) {
		}
	}

	public void receive() {
		while (true) {
			try {
				
				byte[] byteArr = new byte[10000];
				InputStream inputStream = socket.getInputStream();
				
				int readByteCount = inputStream.read(byteArr);
				
				if (readByteCount == -1) {
					throw new Exception();
				}
				data = new String(byteArr, 0, readByteCount, "UTF-8");
			} catch (Exception e) {
				System.out.println("서버통신안됨");
				stopClient();
				break;
			}
		}
	}

	public void send(String data) {
		Thread thread = new Thread() {
			@Override
			public void run() {
				try {
					byte[] byteArr = data.getBytes("UTF-8");
					OutputStream outputStream = socket.getOutputStream();
					outputStream.write(byteArr);
					outputStream.flush();
					System.out.println("보내기 완료");
				} catch (Exception e) {
					System.out.println("통신안됨");
					stopClient();
				}
			}
		};
		thread.start();
	}
}
