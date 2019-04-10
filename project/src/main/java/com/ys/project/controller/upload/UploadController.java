package com.ys.project.controller.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ys.project.projectVO.production_uploadVO;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {

	private static final Logger log = LoggerFactory.getLogger(UploadController.class);

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<production_uploadVO>> uploadAjaxAction(MultipartFile[] uploadFile, ServletRequest request) {

		List<production_uploadVO> list = new ArrayList<>();

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
			production_uploadVO production_uploadVO = new production_uploadVO();

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
				production_uploadVO.setUploadPath(RealuploadPath.toString());
				production_uploadVO.setFolder(getFolder()); // 일딴 테스트
				if (this.checkImageType(saveFile)) {

					production_uploadVO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(RealuploadPath, "s_" + uploadFileName)); // 썸네일
					// 사진을
					// 담아준다
					InputStream is = new FileInputStream(saveFile);
					Thumbnailator.createThumbnail(is, thumbnail, 350, 350); // 그리고 썸네일을
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

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName : " + fileName);
		log.info("디스 플레이 들어옴??");
		File file = new File(fileName);

		log.info("file : " + file);

		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			// 적절한 content-type을 헤더에 적절한MIME 타입 데이를 Http의 헤더 메세지에 포함할수 있도록 처리한다.
			// MIME(클라이언트에게 전송된 문서의 다양성을 알려주기 위한 메커니즘이다.)
			header.add("Content-type", Files.probeContentType(file.toPath()));

			log.info("diplay file path : " + file.toPath());
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

}
