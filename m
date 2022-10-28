Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDAE2916
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 16:54:03 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id 13so14363708ejn.3
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VlWXXhBJnoc4ngEOzP/zoEPXuNu3Pcb27/diH3nA+U=;
        b=LZzR4NF5aoNbliaJSdl30q2EeC7dveHrEZucBmr23Nlq4IrlxZQkMjIW7sDrxWvoN8
         ZH+klDe6aAHzQATRGHz8yf+Fl2GXzKKKD+yilDoMpyjCqEnn4pX5MQ+o0mI8TeeQbmdW
         oKvLqfzKbhkewDLcdKdmr0Z7bIw6jwfZghXizSP5p1eELZwPrC+wmHoCRZwgd+PwCIN6
         IzcAWNLUIJ6LJOjRm9brUnjpjrcAVWBhMX2HrZXFKVt79h9x1ktnCcRths+1BgWnv45P
         H8y96CMGIIHJv+U2qnkiyINb8a/MwbEuwLN0SjVV1OTnjP/xHtAH+tBcnBwsqKdtw/XC
         037A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VlWXXhBJnoc4ngEOzP/zoEPXuNu3Pcb27/diH3nA+U=;
        b=22nbGv05XueW/MUvMEgyWyIUkyWY602Zh7BHGAuyJ9GXE4ZHhBJRpL4ibJFATyVQUI
         7PvNFJPfHbkvDjYlKOy9t372KiKNTZBqXp8GOuoun4hWcyeXh9oNLfV1duY85XtW2/mO
         xSXQXhInWACnP8YrrVzNNec0dfJi9f2TUovo0mFNEv916Pv2Ac54RK9CleSi+CrA8yjT
         OHWJUWFvDOP1G2j0JiKBAnikfI1bRJQ8HbxKhMhX42HOkrHKOBj8T9JBLWK3eJu+mC/K
         qlCeA45OLxrpiOz7cpnNA9dMTggDG2aFTy1JyuN+h+8tCBasBY8yaMPc+No6+zjAaXP3
         azoA==
X-Gm-Message-State: ACrzQf2h0d6Gk7OVY7iMN/ZhMSBRGOP2RTYC6BsHJYsq42SKuZevZiqg
	FCvFIXqvBddHiumAha93744=
X-Google-Smtp-Source: AMsMyM5cCSODkVuBwT/DJJYlpmYX8i7CSbA1kEFYW/4yDxRGIAM38PVcrW56Lv4bA3NjSchaBDai7Q==
X-Received: by 2002:a17:907:6d84:b0:78d:f2b0:14c8 with SMTP id sb4-20020a1709076d8400b0078df2b014c8mr202721ejc.749.1666976041659;
        Fri, 28 Oct 2022 09:54:01 -0700 (PDT)
Received: from localhost ([88.227.58.131])
        by smtp.gmail.com with UTF8SMTPSA id p17-20020a17090653d100b0077826b92d99sm2417677ejo.12.2022.10.28.09.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 09:54:01 -0700 (PDT)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: thierry.reding@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Subject: [PATCH 4/4] MAINTAINERS: Add entries for Apple PWM driver
Date: Fri, 28 Oct 2022 19:52:16 +0300
Message-Id: <20221028165215.43662-5-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221028165215.43662-1-fnkl.kernel@gmail.com>
References: <20221028165215.43662-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MAINTAINERS entries for the driver

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e04d944005ba..4c9719a2439a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1908,6 +1908,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
+F:	Documentation/devicetree/bindings/pwm/pwm-apple.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/clk/clk-apple-nco.c
@@ -1921,6 +1922,7 @@ F:	drivers/mailbox/apple-mailbox.c
 F:	drivers/nvme/host/apple.c
 F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
+F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
-- 
2.37.3

