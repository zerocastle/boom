package com.ys.project.controller.upload;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ys.project.projectVO.Production_uploadVO;

import lombok.AllArgsConstructor;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@AllArgsConstructor
public class UploadController {

	private static final Logger log = LoggerFactory.getLogger(UploadController.class);

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Production_uploadVO>> uploadAjaxAction(MultipartFile[] uploadFile,
			ServletRequest request) {
		log.info("^^^^^^^^^^^^^^2019-07-03 : 그냥 " + uploadFile);
		log.info("^^^^^^^^^^^^^^2019-07-03 : 투스트링 " + uploadFile.toString());
		log.info("^^^^^^^^^^^^^^2019-07-03 : 길이 " + uploadFile.length);
		log.info("^^^^^^^^^^^^^^2019-07-03 : " + uploadFile);
		log.info("^^^^^^^^^^^^^^2019-07-03 : 리퀘" + request);
		log.info("^^^^^^^^^^^^^^2019-07-03 : 리케투스링" + request.toString());
		List<Production_uploadVO> list = new ArrayList<>();
		log.info("띠발 : " + uploadFile[0].getOriginalFilename());

		String uploadFolder = request.getServletContext().getRealPath("/resources");
		log.info("넌 누구니?" + uploadFolder);

		// 파일 만들어주기 reason : 한폴더에 많은 파일이 생기기 떄문에 날짜 별로 만들어 준다는 것이다.
		String uploadFolderPath = this.getFolder();
		File RealuploadPath = new File(uploadFolder, this.getFolder()); // 항상 생각해라 목적지 그리고 파일 생성 이름 인자값으로 들어감
		log.info("파일경로 : " + this.getFolder());
		log.info("upload path : " + RealuploadPath); // C:/upload\2019\03\31

		if (RealuploadPath.exists() == false) {
			RealuploadPath.mkdir();
		}

		// ===================== yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------");
			log.info("upload name : " + multipartFile.getOriginalFilename());
			log.info("upload fileSize : " + multipartFile.getSize());
			Production_uploadVO production_uploadVO = new Production_uploadVO();

			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // 이 방식은 똑같은 파일이 들어오면 전에 있는
			production_uploadVO.setFileName(uploadFileName);

			// 내용이 사라진다
			// uuid 적용
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			// ie에 경우에는 파일 전체의 경로가 가기때문에 마지막 \ 기준으로 잘라낸다 파일 이름을 들고오기 위해
			log.info("only file name : " + uploadFileName);

//			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			// 파일 올릴떄는 (저장공간 , 파일이름) 이런식으로 넣어준다.

			try {
				File saveFile = new File(RealuploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); // transferTo 파일 저장하는 메소드
				// 이미지 파일인지 체크
				production_uploadVO.setUuid(uuid.toString());
				production_uploadVO.setUploadPath(getFolder()); // 리얼 패스
				production_uploadVO.setTemp(uploadFolder);
				if (this.checkImageType(saveFile)) {
					production_uploadVO.setFileType("img"); // 이미지인지 검사해서 이미지면 img를 set 해준다잉
					FileOutputStream thumbnail = new FileOutputStream(new File(RealuploadPath, "s_" + uploadFileName)); // 썸네일
					// 사진을
					// 담아준다
					InputStream is = new FileInputStream(saveFile);
					Thumbnailator.createThumbnail(is, thumbnail, 194, 194); // 그리고 썸네일을
																			// 만들어준다.
																			// thumbnail.close();

				}
				list.add(production_uploadVO);

			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	@GetMapping(value = "/uploadAjaxAction2", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Production_uploadVO>> uploadAjaxAction2(MultipartFile[] uploadFile,
			ServletRequest request) {
		log.info("^^^^^^^^^^^^^^2019-07-03 : 그냥 " + uploadFile);
		log.info("^^^^^^^^^^^^^^2019-07-03 : 투스트링 " + uploadFile.toString());
		log.info("^^^^^^^^^^^^^^2019-07-03 : 길이 " + uploadFile.length);
		log.info("^^^^^^^^^^^^^^2019-07-03 : " + uploadFile);
		log.info("^^^^^^^^^^^^^^2019-07-03 : 리퀘" + request);
		log.info("^^^^^^^^^^^^^^2019-07-03 : 리케투스링" + request.toString());
		List<Production_uploadVO> list = new ArrayList<>();
		log.info("띠발 : " + uploadFile[0].getOriginalFilename());

		String uploadFolder = request.getServletContext().getRealPath("/resources");
		log.info("넌 누구니?" + uploadFolder);

		// 파일 만들어주기 reason : 한폴더에 많은 파일이 생기기 떄문에 날짜 별로 만들어 준다는 것이다.
		String uploadFolderPath = this.getFolder();
		File RealuploadPath = new File(uploadFolder, this.getFolder()); // 항상 생각해라 목적지 그리고 파일 생성 이름 인자값으로 들어감
		log.info("파일경로 : " + this.getFolder());
		log.info("upload path : " + RealuploadPath); // C:/upload\2019\03\31

		if (RealuploadPath.exists() == false) {
			RealuploadPath.mkdir();
		}

		// ===================== yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------");
			log.info("upload name : " + multipartFile.getOriginalFilename());
			log.info("upload fileSize : " + multipartFile.getSize());
			Production_uploadVO production_uploadVO = new Production_uploadVO();

			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // 이 방식은 똑같은 파일이 들어오면 전에 있는
			production_uploadVO.setFileName(uploadFileName);

			// 내용이 사라진다
			// uuid 적용
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			// ie에 경우에는 파일 전체의 경로가 가기때문에 마지막 \ 기준으로 잘라낸다 파일 이름을 들고오기 위해
			log.info("only file name : " + uploadFileName);

//			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			// 파일 올릴떄는 (저장공간 , 파일이름) 이런식으로 넣어준다.

			try {
				File saveFile = new File(RealuploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); // transferTo 파일 저장하는 메소드
				// 이미지 파일인지 체크
				production_uploadVO.setUuid(uuid.toString());
				production_uploadVO.setUploadPath(getFolder()); // 리얼 패스
				production_uploadVO.setTemp(uploadFolder);
				if (this.checkImageType(saveFile)) {
					production_uploadVO.setFileType("img"); // 이미지인지 검사해서 이미지면 img를 set 해준다잉
					FileOutputStream thumbnail = new FileOutputStream(new File(RealuploadPath, "s_" + uploadFileName)); // 썸네일
					// 사진을
					// 담아준다
					InputStream is = new FileInputStream(saveFile);
					Thumbnailator.createThumbnail(is, thumbnail, 194, 194); // 그리고 썸네일을
																			// 만들어준다.
																			// thumbnail.close();

				}
				list.add(production_uploadVO);

			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	
	
	
	
	// 폴더 만드는 메서드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();
		String str = sdf.format(date);
		System.out.println("파일 반환전 : " + str); // 2019-03-31
		System.out.println("파일 반환후 : " + str.replace("-", File.separator)); // 2019/03/31 "/" 이걸로 변환
		return str.replace("-", File.separator);

	}

	// 혹시 브라우저에서 파일을 거르긴 하지만 이미지인지 아닌지 판단 해주는 메소드 , 이미지면 썸네일을 만들어주기 위해
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	//테스트
	@GetMapping(value = "/productionRegisterPage")
	public String productionRegisterPage(HttpServletRequest req, HttpServletResponse res){
		System.out.println("/productionRegisterPage 접근                                         ");
		return "sell/productionRegisterPage";
	 }
	//테스트
	
	// 파일 다운로드
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {

		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);

		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		String resourceName = resource.getFilename();

		// remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

		HttpHeaders headers = new HttpHeaders();
		try {

			String downloadName = null;

			if (userAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			} else if (userAgent.contains("Edge")) {
				log.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else {
				log.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}

			log.info("downloadName: " + downloadName);

			headers.add("Content-Disposition", "attachment; filename=" + downloadName);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	// 파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type , HttpServletRequest request) {

		log.info("deleteFile: " + fileName);
		
//		String uploadFolder = request.getServletContext().getRealPath("/resources");
		File file;

		try {
			file = new File(URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

}
