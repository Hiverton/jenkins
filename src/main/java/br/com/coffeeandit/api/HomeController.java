package br.com.coffeeandit.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServlet;
import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class HomeController {

    private RestTemplate restTemplate = new RestTemplate();

    @Autowired
    HttpServlet httpServlet;

    @Value("${app.version}")
    private String version;

    @GetMapping(path = "/", produces = MediaType.TEXT_HTML_VALUE)
    public ResponseEntity<String> home() {
        return ResponseEntity.ok("push image docker hub 1!");
    }

    @GetMapping(path = "/version", produces = MediaType.TEXT_HTML_VALUE)
    public ResponseEntity<String> version() {
        return ResponseEntity.ok(version);
    }

    @GetMapping(path = "/machine", produces = MediaType.TEXT_HTML_VALUE)
    public ResponseEntity<String> machine() {
        InetAddress ip;
        String hostname = null;
        try {
            ip = InetAddress.getLocalHost();
            hostname = ip.getHostName();
            System.out.println("Your current IP address : " + ip);
            System.out.println("Your current Hostname : " + hostname);

        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

        return ResponseEntity.ok(hostname);
    }

    @GetMapping(path = "/get", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> httpBin() {
        return restTemplate.getForEntity("http://35.229.58.199/get", String.class);
    }
}
