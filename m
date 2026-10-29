Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264465;
	b=j6lhihQvS7GaF4TMb81e0NkkrJTWtIKTjtuPsK7jagXEfTBnK3ufrn67poJ4P5yRrxzk
	 XvqKYaUxZv5SmBWXZhcquIjrpyBTzuDtJCNpQ+wbzZZrlRwI+C2HSXwepakzDB/Ayi/Tm
	 b3J50nLuiJlnd46/rKsXrfHuCRF4dsE8B5Lv7JNIpUVEmlFVNZ77oqv7tn153f1vgRiqJ
	 Adwgxx95AJ3iy2UkPmUQaoPv9DcvipMyDZdnkYkFJGumlt8gFG+uTvs4yF+jsRSNtCw3K
	 K5aU4IIVVQQIUwjrJOT4NB87uFkChZJSn21QmwTqpaFaXQMmsZlGqrkqpuBtiIXSXsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
	b=wgYY1dXpzYm5XHS/2CxXA1afIXy/5hAlIgnGmGQIzzltGZJHnnZ3wxwXrje6MNKmKu7y
	 wd4M2MnPuvaCv3LfvH670IJ0XTrQ9e1mMo5WfOj0hk4v9RT8roGcX3uGIh8MVRUbqeP++
	 kHc4Y0o2oN61OhaRfn8tou89XXZKoa5bM7+ZJhCS5pVlC4qG5Cv5iGZ1FAbUEyBMpBSsK
	 V1Uqs9Yp2Za4r5d2EIYIWTwaM32ysmaX7mJmZ8rSWCEP5944rTNmabGw43EOCPgIy0cro
	 DUni8IPvc7jefuJaxNqj1/avRYDhRParH6yoziLKMBsW7xgbzidnwXMxeTgO4oIRmFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YoI+X4Ic;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114B606A326
	for <asahi@lists.linux.dev>; Thu, 29 Oct 2026 09:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8114B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YoI+X4Ic
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1180414eec.0
        for <asahi@lists.linux.dev>; Thu, 29 Oct 2026 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264465; x=1793869265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
        b=YoI+X4IcS9XoVy86HddnYWY5eXUW0i5m5Enrtgaxzj/Z8ZTUbO2G/RLzzXKRmVI6PT
         knOpS39QyQsrZGyGmsLAQCQ6cG7sIca9mclHknXQQ6P2VAW5/67xCX7eYdBr+EOQZNdS
         WJZzXvg+W8GlF2SrnR/9fDv85Yh4vF/+i9HRcWWOEw+pEIMETEWD5prmLH9JApoOBfCY
         6CyS33NkFWJ3Vokcw7VxoSP54tpngVn9mLL44V8em31EspYWoFt+vPSIXqGja3HvtIDd
         gRF1D/Fuj5asO7gG/8d9pkTm4WXnN53Gk33GhO05UJX5FkzZS6oL3qDfMIE/xeyexaEI
         qjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264465; x=1793869265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
        b=kC8M4YvuX0NzbKrPomZ07ViU0z5AQ28Jt24SmeuU7356z4kujjPHnd7tSWwwRmjMH7
         LKZ4AdCVWotk+Ga10p2+syo0wsvaOO6WcDewq9Qne/kif5EAayg+8pfvoY90brJcWjZ3
         aPhRX3rp+ssVGokCA6lZoySD9oZDmLltxXCwWAiuNxyPZPwcnsXqnpEDVtg/nFhaqpOe
         /aCNXuwuawkOuDIpeXN8s3Y/8E8bteURbwYbf22aDvUR7EJYZTJUlz6KgbvxswfUJ21u
         05rvUaY48wWXGkh5aqIBeTGAOYo5xd/WpGlXCJ9ng8g7CuC1ACFOI0ItIEtshHwk13An
         v9ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHS/IGaCixYqv2tHqr0hYJfcS3yeKkTJ6B0ukGxNhvcWdAPOHZ2SLMQO360TNexAuUH1WONw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLhWsRfM8ykbPtNhfxVl+g4PMy3GGWn4QnTzgPoB3RbTVug/R2J
	STRpK3HEAmaaDxzc22xoYbanFL1ecl+vsTAraRztqQPjiFiSzGsW3Cw=
X-Gm-Gg: AYBFou1fs0MG5kiSSAtBucJ0clI9yhLNegCxp63xCXSpUX/U1pXZgnnapOB5LUn4rFu
	XKIZZWWHXMeEVd7Fb4kHdVLVoULacY7Yqckhyoth/R9MwTgIZM4twAJI4X84gMYcC3xXT/vrLDp
	mKY99JybJia+9LAJZcMajKYYQYGc0P/VIL28MFBwkkUIkCX6TUlPz856mTlrTm59k2+LOt0mALt
	XXag4KOkWray1svHkVf9cJbZ3ErFAv+4JMjH5iNM03XSYtBKDKd4jp3PJ4iM+wpz3Qc+XHhxLFL
	D/MoEmXsTC1+CSjsz5DO5SsggQ+SxV7yQ8FwQ2EutpGAZINJkxNSdIErr44KTd2UwPV/361R/NN
	ekDiq35berIYIpRo1TsgPP+gz7VzllzkaivF1rNc0AQyecVmARsr7bEmA9gEQB4Nyw90r0+bWie
	p+q7zQUrOQqie/kJU7u7mZw656CVXKsrQek11FNQzLyXxRNvjYUlQaIjAK9SSa0ggBzv+kHx5O2
	BTuUxppHSrqDEhweIb7gc2nuLWgeZemfTDRGKq/cwtt1OxPPFWD0ndyc+iianK6LRBLLZErQ3TV
	MjjSH92dlwyVIcMpM9gWAh6wEGit/NufLC5idbQ7/AEqAeuqtXtoN+/65zvkOQ==
X-Received: by 2002:a05:7300:f894:b0:351:207d:bff4 with SMTP id 5a478bee46e88-36a202bc360mr7083860eec.4.1793264464275;
        Thu, 29 Oct 2026 02:01:04 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.02.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:03 -0700 (PDT)
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
Subject: [RFC PATCH 11/14] acpi: disable battery and adapter for x86 apple machines
Date: Thu, 29 Oct 2026 04:52:08 -0400
Message-ID: <20261029085504.3547-12-atharvatiwarilinuxdev@gmail.com>
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

When macsmc-power is enabled on an Intel Mac, skip acpi-sbs
and the ACPI battery and adapter drivers, since macsmc-power
now provides them. This avoids duplicate devices.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/sbs.c       | 17 +++++++++--------
 drivers/acpi/x86/utils.c |  4 ++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index f10bbf13c..b12f2acc0 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -634,6 +634,9 @@ static int acpi_sbs_probe(struct platform_device *pdev)
 	int result = 0;
 	int id;
 
+	if (IS_ENABLED(CONFIG_MACSMC_POWER) && x86_apple_machine)
+		return -ENODEV;
+
 	device = ACPI_COMPANION(&pdev->dev);
 	if (!device)
 		return -ENODEV;
@@ -655,14 +658,12 @@ static int acpi_sbs_probe(struct platform_device *pdev)
 
 	result = 0;
 
-	if (!x86_apple_machine) {
-		result = acpi_manager_get_info(sbs);
-		if (!result) {
-			sbs->manager_present = 1;
-			for (id = 0; id < MAX_SBS_BAT; ++id)
-				if ((sbs->batteries_supported & (1 << id)))
-					acpi_battery_add(sbs, id);
-		}
+	result = acpi_manager_get_info(sbs);
+	if (!result) {
+		sbs->manager_present = 1;
+		for (id = 0; id < MAX_SBS_BAT; ++id)
+			if ((sbs->batteries_supported & (1 << id)))
+				acpi_battery_add(sbs, id);
 	}
 
 	if (!sbs->manager_present)
diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index 418951639..9f3b9b7d9 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -14,6 +14,7 @@
 #include <linux/dmi.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/x86/apple.h>
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include "../internal.h"
@@ -608,6 +609,9 @@ bool acpi_quirk_skip_acpi_ac_and_battery(void)
 	long quirks = 0;
 	int i;
 
+	if (IS_ENABLED(CONFIG_MACSMC_POWER) && x86_apple_machine)
+		return true;
+
 	dmi_id = dmi_first_match(acpi_quirk_skip_dmi_ids);
 	if (dmi_id)
 		quirks = (unsigned long)dmi_id->driver_data;
-- 
2.55.0

