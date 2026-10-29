Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264410;
	b=F9DOwlL6sACfBaxEU+Ylx1Kxx6gjSzIMigFaZDXOw9cJ8DhtzAU3RLVyOJHO/wv0Z4YF
	 sRCZA3hKvTRmnyqOsgWwa9pr8JYIhMbNSXh/T41MGt7KbFHY2rox2jWSe22Mqjb1vdzT0
	 JT2xgKJe1/3O5T6PYfKded+QaQ4a8hkK1yhIU33c7MGdRa6Afpeao3jBMOcW3dRlhw/DO
	 DCn7YRALemQgNPa6G94Tm9NzryYCAf3L1+BhZfOzPUcpAvcLg0UbE6NvuFH1u0aoHUu5A
	 MPZwxY86pV4skK6HF+ja/Z7NpEOCsoZaJdN0jcbuYJPE7pT3uwdKXebElRLwAuFOGIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bas+A2pwMPdYKlr8K9rmQmJzztUh1FCL0UJNjmXGJUs=;
	b=h7sATu0QKmnh4eIanUEbaxbpW50ierEXYy31DWQkcGmzyjbUL4DEDCkxg3rOYd/3ZdW2
	 nYDRKddXZBYz11Gi9NXovuBaHWXQwWQo26BB11+yDbluWoirg/QCdC0ZWG6cIh13mIV7t
	 Az6kXpFcp9W0R2mqKFyir13cvrx3S5rTlQr1ce2XJey4CEuSkNugYm7ECrgcNAbYdY9+X
	 NudySTzpMGWSG3oLp/hOAGl+UD+909YyQQYsQgbNR/Y9Zw/LmPWBcYBPhvIRFGhfNqXhO
	 rLzJ7ILtGT80F04mtJHC7z9zIlBMq06Q+FtyA3EfHOEBBknSJawemOvu/MkB06WxXpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLLJ8fNO;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA000606A31C
	for <asahi@lists.linux.dev>; Thu, 29 Oct 2026 09:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA000606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLLJ8fNO
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a1947498bso1259134eec.1
        for <asahi@lists.linux.dev>; Thu, 29 Oct 2026 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264409; x=1793869209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bas+A2pwMPdYKlr8K9rmQmJzztUh1FCL0UJNjmXGJUs=;
        b=xLLJ8fNOm6W7/vCn5xXLBSAlYxsH6/vCczWsJecYSFlwoV/zhqbbg+t3ApwW9dqhq/
         1XPWJt8zLfhwoeEcqaBh+ccqR2EwWKXmOmptvVtqh21J2+NRyEpNWOT1QohXNHpjDc99
         W4hpNv5OAK+YML3apPv5u2ewOsQK4rojjQjRu3Q6bX3UyLPu+6oaBYbbsxBBSVvUgClw
         T20OEaX3q0k7Y9b+/V3yy/xKDqAUWMaLR1Pv+V0lePb+lL1gdnmADgKGYR7cthtct6zQ
         pdXinEauPo1NLZyyv+xH+dmo6G/8zpulQFldiJtRtCR23qN/3Rfr6D4gaVXJPZzotjEm
         6wxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264409; x=1793869209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bas+A2pwMPdYKlr8K9rmQmJzztUh1FCL0UJNjmXGJUs=;
        b=sGTL0d1782te3y9nD0hvPIzEA2zgiF/p2CCGeVOYKxuJ78Qd3EEWs9BrC8Vovddr/m
         0iOKwTM7+pZ+2k2eN2mH0lXdZxEGb+/Q7w+ZtEkjCx4XqeaAZTKLzkuALjhgN2mUyoJN
         PvV4PbILo7B2XyRNff+oUGF7/O7iF7i29J6mN6sEFCs578RTdJRY5LZdzd6u5WFakVsU
         BSPrCBASgs8/72smTuWe66IPuaiEkcS4hGjgL/18rjLo70teKdTXn9Atr2k07/EGgt+L
         r7jwKA/nQ22igfQRT8i2okfu8Qyz1ooL7G0cJytqs4TonK1WapHIsPd/Soc9QVkgQJbL
         wnKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl0mxKiNudYYdlypwkZIxhLhCa5/YMEkpOKtH1v88sCfIJeFFMfG6mOasVT6UESY/Ke2/hZw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKGDHyXxWwoNoUl385AYsFC09l1q6tqTtVf6UHKPf5TJwU5Coi2
	G2r0dw8MLAs2/EtaeiyxUxrQp6BELzCEhAX8f4cGOr30p0ewLExxtOE=
X-Gm-Gg: AYBFou02nv45bsAN7p+WTIQdhb9r5M9k1gWjpdnXJZUqepd3edwYRqTiYaKmD+DoY2a
	Wh5mkUrtprEWeKFgBKRm2dMQd3mdQB3WFsCevXyImx3T+kfguTOO9Xz610Fn4P7fzX5GsXbW6XQ
	XbRVjjOg4CLYWUtRuAbnJAQh3ub/QpcY3iJ7E5kURyFG5rg0U60AlBZIRUznFPYEmdvyOEi92V9
	8FmyTGfZ4/Dz9ltkF9O0+6snKv6FQa97siKQ0C6XJ94q8IPLOWhaE98TELPpg6DifNQ+JIeVm9d
	Xwmz+Pa8gTH5sNRPeoawbQuPop2fWsxwVRzxXXSKbwNKqC7yR1aKonbzoQNhe8kmG8V3lIBJRDQ
	m3p5Q2fMviCIharmnGtfpxTikSdcmrPJlH+BriYHPYAPz/MZeSrCWoN+rSN6S48iyn+1Xny14P7
	QwZIuV2UAPh7HJ1LQBcvuznrr+aritSQjHqb597/3nMG4ukkCFLPbmposayBxvnBNAMD0z01Wiz
	8EEe1pCw5eGuJ7wiaPK9cBNFs69IUEmz41jcRFmdc99QJyvzWjePbsVN29iG4ilatbcX9Rhax8W
	ZY1utrL7UUJszBq6nHhlAQcmOxQhCmhRPfGeXStbuPu/MIYnwdWzLMZwLBU2/A==
X-Received: by 2002:a05:7301:d185:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-36a20119d21mr7048294eec.0.1793264408741;
        Thu, 29 Oct 2026 02:00:08 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.01.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:00:08 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [RFC PATCH 09/14] treewide: disable other rtc's in t2 macs
Date: Thu, 29 Oct 2026 04:52:06 -0400
Message-ID: <20261029085504.3547-10-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
References: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CMOS RTC and the ACPI TAD clock don't work correctly on
T2 Macs. When macsmc-rtc is enabled, turn them off on these
machines so macsmc-rtc is the only clock.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/acpi_tad.c | 4 ++++
 drivers/rtc/rtc-cmos.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/acpi/acpi_tad.c b/drivers/acpi/acpi_tad.c
index 45459a4ca..a137a39e5 100644
--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -28,6 +28,7 @@
 #include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
@@ -845,6 +846,9 @@ static int acpi_tad_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (IS_ENABLED(CONFIG_RTC_DRV_MACSMC) && has_apple_t2_chip)
+		caps &= ~ACPI_TAD_RT;
+
 	if (!acpi_has_method(handle, "_PRW")) {
 		dev_info(dev, "Missing _PRW\n");
 		caps &= ~(ACPI_TAD_AC_WAKE | ACPI_TAD_DC_WAKE);
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index fa04ece15..bdb436e24 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -33,6 +33,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/platform_device.h>
 #include <linux/log2.h>
 #include <linux/pm.h>
@@ -944,6 +945,9 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 		.priv = &cmos_rtc,
 	};
 
+	if (IS_ENABLED(CONFIG_RTC_DRV_MACSMC) && has_apple_t2_chip)
+		return -ENODEV;
+
 	/* there can be only one ... */
 	if (cmos_rtc.dev)
 		return -EBUSY;
-- 
2.55.0

