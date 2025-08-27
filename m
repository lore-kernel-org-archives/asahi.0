Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CC352094
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293814; cv=none; b=lCkkBa3ElVjQEpWtyXyQj9DzXczR4j73/mwCI4M3mcJHWC6codvWIwY7YhxGicQeYWxyQfQ2pwDuLFZDSbX0xDuQ4JmPQxQzlkSSNNSt2Ut8Z6yrx6acrmMEOW8BOr0rFFsHKnApHnPE/fXyLQ7rT5WnA02jhHmJxJZr2WppUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293814; c=relaxed/simple;
	bh=MzVBIMhZBV0HKkjqFJuByEq0RXCQQFero/TsgkVgPbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0XeJgGjy7TlmsLGQQnuTPdhCc6N8pZU1ZBvm5YokVgVfAwTPLaQdCvInoAOn45fA+hpROOYZdib8KlYfHKpCMccFvQGa7+8WfmdpvkR+dgJVph35Cbyncjr/3cuYmDwv6N1FMQA+MGsvCUHj7FvZoDNsUZI65EHzbVwlXu+5XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPaSgBaW; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPaSgBaW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3253f2a7679so5413419a91.2
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 04:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293812; x=1756898612; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LG7aBav28TifE54xitzYyiUVJ1+ZLQf1Whcw7hJdaHY=;
        b=HPaSgBaWzn8ywet7ClUwf9sDiAuEqybTgN54/LiWvQ2iVzyKq06Pidh6jtb3hbW3YP
         Zey0OJc/rBjQ15GG8bR7MZkOknEvYr5V8uO0fXPYoktBuMFPTQ4QIzjOHAqpdyDp2AUb
         izneXitcp+JQJ5BqITR6pjxNO9gVf/yA05ciQEuSKVyfv78XRZQ/VwvGyWcopcfOdIaV
         BfBD+ALqCz17aTfXalTStSAkrHOM7j0gXQ2IBEkHIZgUEarBYBzwQnpxVn5qFMtiL9L5
         P/V3Q8G4WP+OfDU0NL02aNOnaJQfo9lbyCC1xuWOdHm9K1/TMoORMqdrxd3gIb450+vV
         0PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293812; x=1756898612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LG7aBav28TifE54xitzYyiUVJ1+ZLQf1Whcw7hJdaHY=;
        b=GjzVx82TbdKcxY6bx7eYqaXyKvlM5hwvKFfcZJ9yRIyL5Fdsq7X6zndPtHHETHlWgH
         qWVbq8+7v9v5L2+H/vlqXB0GAqKPkjQQuqRWQG/Xw316BR8lT+Yxwsm1WMiSrpX/8xLG
         dkpKaEl1/Fi5SOYfQVtlITpvn19PM89cEovj4KQQq5QPmIW7GnWI7KbWFTS550ERNRGX
         wOiTPfM+t8euAIMh/kRiUuQCi802a16NvW1g3p+r3IryjxU4AXxrkH/+cZQpaaz3kkmD
         CwY4sMSJBDWzkC1Win2JtUbXZlma3h1RR17IYqbfqmHqqBhGieZ36ZhO9Vsf6yp1TcFI
         UqKw==
X-Gm-Message-State: AOJu0YyYAqRbLf/5F67IAfqG2sVlBatVrlXRGvT85hPPuK3Wp0etO/Px
	3g3Kd4nzgWYmB0DOUtDjRzhKL/twGWk1oFNq819xdiw9/c6/Jic/1FCq
X-Gm-Gg: ASbGncv4rs9MEZxas9Epbb837RSA5Fmp9vp3z+myRqVo2dX122tukl9WyWRScN3H1pg
	+fvltkAWLuY/y0W/JJ2JdByH20spHK/jMWaQZBxicTwtkHqC+BSoZYp9gkAm7/PfHL7s+2uKDOo
	FC1wxs9w7Da8VnLr+qL+tS0Oo8OXhIf0QrYnXS37nSDVDdxO3SHxQdUEjeswVAGRadpMlxl97lq
	RMfj8VW6JNVfjmRjgI7kPJIad6kzGVZPW1euYaTlQYepYyaE6Pxuaoe+HcE7d8ob/pDEaxUeNyM
	er/vN8KmzSDZnJA7qCL6+U2gamk/2fZfA8ttEgCy5WfYlqne2mODxjm3WMKn8RHWsXaPbrNbRFE
	a6I58FL7AmTRtzaxLfBd5TqRFv6Pj6yu/0jImThXblpromVxVyA5PsKrubThcDWSkW+gY1Lrf/E
	Z6fuwPFyGtHuivGjFa
X-Google-Smtp-Source: AGHT+IGiOxv9V6MjUF8W3nBziWAzOujTYr/YcybLHLky8CSMlEhB3V6Q2vxGNJMmePXDcxETbRO/Dw==
X-Received: by 2002:a17:90b:4c02:b0:31e:ec02:229b with SMTP id 98e67ed59e1d1-32515eabb9bmr25336674a91.20.1756293812432;
        Wed, 27 Aug 2025 04:23:32 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:32 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:40 +1000
Subject: [PATCH v2 06/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-6-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=MzVBIMhZBV0HKkjqFJuByEq0RXCQQFero/TsgkVgPbo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjVnT/rJIPuE60z/BsMkY5Gacx1BZhKGvuYro+yPT
 3c5xTS5o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlosjEy9L2TsF6fId9yp/VY
 El/Q7mvv1uUbH3n+v9ni/KuPixomnmRkeBJt73vIvPNu2Z010ltm2P91mTn3zzOJQzuOfT/6kqn
 IgRUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 59be894460d33afa754927630881532b548b7ad8..286dc150aa6cfdd6d29f769094278daaddabe7c3 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0

