package com.example.demo.siteuser.controller;

import com.example.demo.siteuser.dto.SiteUserInfoDto;
import com.example.demo.siteuser.dto.SiteUserMyInfoDto;
import com.example.demo.siteuser.service.SiteUserInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/users")
public class SiteUserInfoController {
    private final SiteUserInfoService siteUserInfoService;

    @GetMapping("/profile/{userid}")
    public ResponseEntity<SiteUserInfoDto> getSiteUserInfo(@PathVariable(value = "userid") Long userId) {
        SiteUserInfoDto siteUserInfoDto = siteUserInfoService.getSiteUserInfoById(userId);

        if (siteUserInfoDto != null) {
            return new ResponseEntity<>(siteUserInfoDto, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/my-page/{userId}")
    public ResponseEntity<SiteUserMyInfoDto> getSiteUserMyInfo(@PathVariable(value = "userId") Long userId) {
        SiteUserMyInfoDto siteUserMyInfoDto = siteUserInfoService.getSiteUserMyInfoById(userId);

        if (siteUserMyInfoDto != null) {
            return new ResponseEntity<>(siteUserMyInfoDto, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}