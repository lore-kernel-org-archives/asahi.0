Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542A11DB54C
	for <asahi@lists.linux.dev>; Sat, 25 Oct 2025 00:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351950; cv=none; b=aa0Cy6C1U9I5KaLtoZGnuub8UlC56vhFgbEJCCAqoUmx4Q7FXOnmlwz9/z8ah32zgTxdYZTh642UjI6Ii4gn72y2mYcGEpVjxReJkJB569YKoE+jqbVyecBLOKqfZM/ck51/E+HL9ixLBtC3SEoVcSVphHL5ic/B2NYS7piwXlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351950; c=relaxed/simple;
	bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYOvPmugHZ3TCSP++cRNCtm+ncf6RLgkBQO5JPbz3iqAqDiVvvdvqz8CvRqzd1EGfJurLF7Z/R5+BUnBAn5ljcXiNS8JeN/0H0dEXdwvUYpCfrGXIxP7bZkVsRsKW5BQ9hb/7efuTZj5K5eFfJ499/6hVfsqhky6TUOgGgawkOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQbX02WW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQbX02WW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eec33b737so37922145ad.1
        for <asahi@lists.linux.dev>; Fri, 24 Oct 2025 17:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351947; x=1761956747; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=UQbX02WWGWbs0vlMxn8qI9xaouXdd1opERmW30Fski+2E6UKFg1Ad1FoMlGzroqZYD
         t1uvPBoD0kxDKYbfP0xYOPeTwERVVqEcwcC+MoWisT4pUDa/jqTIv2nxfHxAQ5x8pkPG
         H/GUatWtU3NDhLjk1bzFNLMmlfn5oEUJEtw+ZjdmEGB123G8rjONOY/Frt/VqINI7T9c
         +lB7Hp1yRJLf6pFu7fCMaaM4dfdLbpwKkRU+3U6faVAoef8cmK7eS8A+PVJU+gNgD7eU
         Cr8LTG1k3IL/33za8lM4A8WoBglJ39eEPg6Vd7LWZ7++bOxFopdOKpgn2Mt1Zy8V1sE4
         t/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351947; x=1761956747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=YjY/BaCs0TFjsGa+OhKRDNMzJ5PUe4kOAlTFer/1+LFQGsPL6FHzUYgGmijwlzpDsK
         ZGdi4OZMhfYfS8SVN+7VLcihvx1SjXqx9wmhH0wl46PQUTAsa3NtdUGbLhedpYfu/LSL
         pHDEk+PFnEnOUgzDvKFhdQrkoUys+KBM1ZTh8mB6Mb9b1+Jbbr7Am+KKtdFZu3KEuZF2
         xYabptIHqkFGOTq3V0vqEk4baqLeEze4+jjCYT25ijJhUn6/KSs3gurg4y1DYh0nah54
         5FsgUFJeCb74swi49WGNHRbffV4bhOPFDnOIdjgfh9NCRoWgERM6qQtAQ9vzh8M4N1ui
         XvOw==
X-Gm-Message-State: AOJu0YytHc/Rvh/631IxmLtSMqXlwrbf8tjVCZaPPtitfVfGG+PVXyQh
	aKqEDsrxwdZzkX805ljVqNY+mSkryzjcEFirvDw0oZBRFlFJQnCBcI0z
X-Gm-Gg: ASbGncvEiSpuWTrtwiloLeU9xqIZsr/cJNGrn8kjTkM8Tmx0Ov98fNLeFr7pK0je1nT
	hiba8GzyK4k1NZCX63YBnNZtyxyXcEPcehGFqL4sz49LUIqNJvGG+Cei8ZQoRBm1jHfi3bxs6NZ
	8i3klDc3BsSVBoRMIBSXE2Tptulbtj7q2Y8ZJh5exqAmkBT7RR6bRuTmFP0CLx+S+PZgvJ3m+73
	4yMLS2bf/Gg2zQuIe9ESt1GRb31vFTjI+EJR5iVegrvqUksF0Khiw/yvxgxUFm/XnbEixKrTUVu
	/BXgwC1BP1I3kirni2aDIyCK7V8YP4i+lOsaJW2aJZfzNn1+L8MQtjU0j9DSPWlWkFme+GNUW23
	SzHZEqay+Ks0UXT34r3wqvVQv0N+uTbVZonRiBpKbFjyWaVrD5gHez1ystl62picXliodgGy0Qk
	Evp7xwZq6U+gK8aPRx2Wu+hHfU6fXmsHzgZHQWDmv0McsgQUwZRfWShmIGlJjfHaiJ5/TfQf0Ky
	iO/Z4XRrZuNuHfncXFF3l5cjCbNnHwqK9SyDMkTGOFDLNmhNBfNJTRZUd2w3mOC
X-Google-Smtp-Source: AGHT+IE7b7WlJg8PMfCez4BRWP01L89M03XHDqmXIAUdqR0o0INVIyz4n2FlGNeMHwcTEVAj8jvj0A==
X-Received: by 2002:a17:902:ce12:b0:267:a55a:8684 with SMTP id d9443c01a7336-290c9c93abbmr330781785ad.2.1761351947512;
        Fri, 24 Oct 2025 17:25:47 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:38 +1000
Subject: [PATCH v4 07/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-7-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7tvHxyY2mQfvkOj2Ou1b+lL5wt2qeuPnvBRX51B
 rNbl1QLOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNdv5aR4VLggrKHBVUNC5VEVaVC98ZfZxOt6Jh45+IVmwlNsr23dRj+Z+7eV7D
 x+NRGVakE1ehjKc+n716bd2HBjQL/Jt/QqBk9XAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0

