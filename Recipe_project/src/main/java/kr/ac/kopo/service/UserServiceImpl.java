package kr.ac.kopo.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.mapper.MemberMapper;
import kr.ac.kopo.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void add(User user, String emailId, String domain, int resident1, int resident2, int phone1) {
		String email = emailId + "@" + domain;
		user.setEmail(email);
		
		int birth = Integer.parseInt(String.valueOf(resident1).substring(0, 2));
		int NowYear = LocalDate.now().getYear();

		int birthYear = (NowYear - birth < 2000)? Integer.parseInt("19" + String.valueOf(birth)) : Integer.parseInt("20" + String.valueOf(birth));
		
		int birthmonth = Integer.parseInt(String.valueOf(resident1).substring(2, 4));
		int birthdate = Integer.parseInt(String.valueOf(resident1).substring(4, 6));
		LocalDate birthday = LocalDate.of(birthYear, birthmonth, birthdate);
		System.out.println(birthday);
		user.setBirthDate(birthday);
		
		if (resident2 == 1 || resident2 == 3) {
			user.setGender("남");
		} else {
			user.setGender("여");
		}
		
		user.setPhone("0" + String.valueOf(phone1));
		
		memberMapper.join(user);
	}

	@Override
	public User login(User user) {
		User mvo = memberMapper.login(user);
		return mvo;
	}

	@Override
	public int doubleCheck(String id) {
		User vo = memberMapper.doubleCheck(id);
		
		if(vo != null || id.equals("")) {
			return 0;
		} else {
			return 1;
		}
	}

	@Override
	public void userUpdate(User user, String emailId, String domain) {
		String email = emailId + "@" + domain;
		user.setEmail(email);
		memberMapper.userUpdate(user);
	}

	@Override
	public int nickCheck(String nick) {
		User vo = memberMapper.nickCheck(nick);
		
		if(vo != null || nick.equals("")) {
			return 0;
		} else {
			return 1;
		}
	}

	@Override
	public void profileUpdate(User user, MultipartFile file, HttpServletRequest request, HttpSession session) throws IOException{
		// 저장 경로 설정 (resources/upload 폴더)
		String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
	    File dir = new File(uploadDir);
	    if (!dir.exists()) {
	    	System.out.println("생성");
	        dir.mkdirs(); // 디렉토리가 없으면 생성
	    }

	    // 파일이 없을 경우 ""로 처리
	    if (file == null || file.isEmpty()) {
	    	System.out.println("확인");
	        user.setProfile(""); // 빈 문자열 설정
	        memberMapper.profileUpdate(user);
	        User mvo = memberMapper.getUser(user.getUserId());
            session.setAttribute("mvo", mvo);
	        return;
	    }

	    try {
	        String originalFilename = file.getOriginalFilename();
	        if (originalFilename != null) {
	            

	            // 기존 파일 삭제 (기본 이미지 제외)
	            if (memberMapper.getUser(user.getUserId()).getProfile() != null && memberMapper.getUser(user.getUserId()).getProfile() != "") {
	                File oldFile = new File(uploadDir + memberMapper.getUser(user.getUserId()).getProfile());
	                if (oldFile.exists()) {
	                    oldFile.delete();
	                }
	            }
	            
	            String newProfile = generateUniqueFileName(uploadDir, originalFilename);
	            File uploadFile = new File(uploadDir + newProfile);
	            System.out.println(uploadFile);
	            file.transferTo(uploadFile);

	            // User 객체 업데이트 후 DB 저장
	            user.setProfile(newProfile);
	            memberMapper.profileUpdate(user);
	            User mvo = memberMapper.getUser(user.getUserId());
	            session.setAttribute("mvo", mvo);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	private String generateUniqueFileName(String uploadDir, String original) {
		String fileName = original.substring(0, original.lastIndexOf("."));
        String ext = original.substring(original.lastIndexOf("."));
        String newFileName = original;
        int count = 1;

        // 동일한 파일명이 존재하면 숫자 추가
        while (new File(uploadDir + "/" + newFileName).exists()) {
            newFileName = fileName + "_" + count + ext;
            count++;
        }

        return newFileName;
	}

	@Override
	public User getUser(String userId) {
		return memberMapper.getUser(userId);
	}

	@Override
	public void deleteUser(String userId, HttpServletRequest request) {
		if (memberMapper.getUser(userId).getProfile() != null && memberMapper.getUser(userId).getProfile() != "") {
			String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
            File oldFile = new File(uploadDir + memberMapper.getUser(userId).getProfile());
            if (oldFile.exists()) {
                oldFile.delete();
            }
        }
		
		memberMapper.deleteUser(userId);
	}
}
