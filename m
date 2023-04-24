Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF57C
	for <asahi@lists.linux.dev>; Mon, 24 Apr 2023 11:40:55 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-956ff2399c9so720518966b.3
        for <asahi@lists.linux.dev>; Mon, 24 Apr 2023 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682336453; x=1684928453;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atxqe0IIK6VDLPs1BwgFpTOFx3cvy6f167JM1AHQk1Y=;
        b=rqR0Aznkpa/KhuYo7EPT5kkIe8+ouuxZJ9sHP4Qho9DYWp83KM6BlUpNAnn0xSGLIo
         ZFVgRHM6edU8MKhCgxxayxrDx5z7ZXNEcV5POFrJmPqOxzDgrG682DZ/ooLUjTJgqcSl
         SzIE183YMcanum737awhw51qB+Co0uWiRBMs2e8j/YldO2S7gwzBC8wKYptf02p0y5jg
         kSO7SjXB6h+RAHwXHci9NHdgrdwZdOtEUZaP8AWEYGsXYxJd8Qml/TsX1vpUfSV5ejM1
         4k/Pxlt1hskBtIrYsBYKUMXL5GIodI7MJCJuzU41DiBP/l1sVmqQgSRo/ysdB5P+YFaa
         ynhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682336453; x=1684928453;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Atxqe0IIK6VDLPs1BwgFpTOFx3cvy6f167JM1AHQk1Y=;
        b=Uavc6YOq+m6JADaBjsDm16Zm453s1RzpsEKuLF87H4YeH/bMn1PyXWjh1s/KKmg5Iu
         R7yQ1LxMm5Pu8mVpLFZtd6CVoyQaS3WJISgPUycfVO1sUTwaLBhTosLhR6xgV+avm41I
         wUap5rzE4GLqNU6yEnhSqOFYw7xl4NtmIoNWDf9Sl6+oMOzH5aB+liVJxD6UourDjHEe
         XB+nR8WgCJ5x/Un1BvdmL5TlbaHgeBetC5zewPGdXJJMFyq5ph8tcDarlg6yUBDLPUI2
         ARN1OFDXrvb8AlFSJmgDkwFEji+8oc9cH6keBMkApW8ymQsSDlZlholKq3XqdArF1GDD
         619g==
X-Gm-Message-State: AAQBX9fONjQV56qB04Rxl6zp+suPMIrHBe9qcKgRo1dilpnIQa649dB/
	2Ql0WIF9Il8bVmNCDmSdwXs=
X-Google-Smtp-Source: AKy350aX/xBxpt1PnTgQ8kFjllzm6KAbnrCFnpuubj37N4v9I3qsOO7RD9Jp4Yeguir8tzDIEGhL1w==
X-Received: by 2002:a17:906:cb94:b0:94a:826c:df57 with SMTP id mf20-20020a170906cb9400b0094a826cdf57mr8242043ejb.39.1682336453548;
        Mon, 24 Apr 2023 04:40:53 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:d8ac:5455:8f1f:51ef])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b0094f257e3e05sm5415705ejp.168.2023.04.24.04.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 04:40:53 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Sasha Finkelstein <7d578vix8hzw@opayq.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	asahi@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust file entry for ARM/APPLE MACHINE SUPPORT
Date: Mon, 24 Apr 2023 13:40:43 +0200
Message-Id: <20230424114043.22475-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

Commit de614ac31955 ("MAINTAINERS: Add entries for Apple PWM driver") adds
an entry for Documentation/devicetree/bindings/pwm/pwm-apple.yaml, but
commit 87a3a3929c71 ("dt-bindings: pwm: Add Apple PWM controller") from
the same patch series actually adds the devicetree binding file with the
name apple,s5l-fpwm.yaml.

Adjust the file entry to the file actually added.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82bea269e242..a430ea8018ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1961,7 +1961,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
-F:	Documentation/devicetree/bindings/pwm/pwm-apple.yaml
+F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
-- 
2.17.1

