Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681241;
	b=Ex3lPGJppYMfH1+N52DFAl7oFrqEsFcbvQvkCWpaNMq7qOUiZ/nibKiYUYgOIAgDACP3
	 LWCuvLsehESTuLAhrJjm8JXWHKL2gCU54LJfsKc0w4AR4Sana9rK/VxFibjpL8fFtRr+V
	 nK0JfDzuTC0tkYGDMmMkPRzSd0HuAwzF/WeOENBrzY27hSWuySzr4YORlz134wWnkQT5j
	 I95PxZM4ieFsfbFFh8GUcGL/7vTfG5Gxzx233beTA/8OZtYWLT0nvKhP7XK3mm9MMDZpS
	 VDMJGkV+wogJdtPL7mEO6onoWQn7X4JcO3yhVO8XgbICIvXrTcSPTxeJ6WgnrqfNYgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=;
	b=SGDYVeq6UZ+1pj2AbifJmrDNddg4fWSpMkpvEdcYBZEqI7BFFSut4uJJgY/Bo6hNyMWh
	 yNgS3QPA3YcBCkzq7BXkAfKecN+EQ2qKPV/P8OciuiVvLd9EyjZiowTfh703q33cWs2lc
	 Wz+hpwd+5wgZdZIJqB5PFZLH7TreHUF4DuXlUfk9h34Mhq6In9b1MHa2TZY+qMYhCTAbJ
	 Hfc7pAcp4H/wx3PTTu4iZqudZn+BnRxQMoxl/QsQlAKpyY4FdulAzindHHvrKCBrO6gdO
	 XNcwv6E3km9cz50u5dc9/7EOUs1EkMpm8nXhda3PlDHbZo/g5LXKNJg5OpWb7xj47UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSWLvJlz;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E5C606A334
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 04:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E5C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSWLvJlz
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4758550eec.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 20:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681240; x=1794286040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=;
        b=wSWLvJlz2iv8doWGZotGrD3D+EEaTOpOgzAtYYcMfbIDb67l23R4ethJUv0ZzycvVG
         Scls4LeSmtt+xw0ohrmz3zlQC2uVqeRHnqUBnQNRqMfZhxPmZ5xv1ASbYpTo7Avx0biY
         3RkJMWg90e8nGORjBUO27/T1N/ydddWY3IkNBLfNxMO5VRxraRq0BFGEkge0F+fybCIT
         Cv9m8UTOcIEb7rv9sAShXDgE35z69M/Tv03opYBn6ZF08Kca6Fcbo//III3TuTvS/Zft
         HFBtvYjrq9+LifXzqdGz5QcfMk+xXJP6Op4dPtZv6wA9pt3hXtkDSbD/syq8m0QwfX2J
         AhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681240; x=1794286040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=;
        b=qa9qofCFn5ImJ7b1EYhNs01nGqWb+uVAhR2ZBVy6i+eoilJu4Td53ygqjBObocCuwC
         3gCpxW2506KxoLbtRmCJMRpIeex0TtgJWdhHyJsUujIeA3sswZiMTCVgPTegorzRDCnJ
         3nBvVbEw72NYhkLITSKgMZx4PMakg+Gxu0fFhGJsIymh58jGJY5JcoeoL+ymHBrR1j7G
         LnNZmRqvnqGemnOAY/oexuz1cUEqAkdvw92NMf3gJDu0EqBgJUd3pv9nGMlMcUBKSed6
         zljpeYZaGXVErlHO4Gkm6gYTsHLM7gLEmXndm0FtFXHHcB/EBxQOT3XmCx7Hm1TJsC2T
         u6pg==
X-Forwarded-Encrypted: i=1; AKwUvBzyTN9ox53u86Y6dq82Z7Yw8afTK0FvcujM74rcj96eV19mJmAugDEVGTfTfXNH4EBcJYG7Iw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8iiUoHoLryT7MAqg2F4QD00rwNwwellEdx+o9/eiltOYYIWr/3
	zC67dqEjGCfQzE0ntHlZxVqGtDM+n4Rgkf5et7JASx4/B4Ve/opmkQ/S
X-Gm-Gg: AYBFou3fSloJ8rsQpXFJ9sKDprpQy1pf0WuNWOMPhOZ7trrcMwVK8gozrFzQ3MjJ4Is
	OSihCDYWcpckNS7qjkvtXmSns+b7ZFPT+dlKc3lDjBw0+q+TgpYfnkocB8WNhjpkbqwHraGi4dV
	d25RvhBki3lkvtzAh8+aqWIl2Um5aaynZ9tBJnyFoWY/JqF1rH2GQmZ6XFa3c05Hw6ONO5wpLvz
	LCrJ2vM74MgwU32GZhgXs3f9Wi+uTeYrJ2B80luK7iF97qXYYoKRL0LW0Z0YZtv1xFLM0qWJlEV
	H+DtyogL7NPrJ7WmyD7i3Gp+fyJl1e9xQ9Y7HrW5IlVX/62qUCXD/FDZr9XXQiuNzsk5XYm+Im9
	rmDKOnuwQQmds5NtD8F8ZK0INPx0LddFKd0DGAFRs8JTb+uBIzcF177223whxvB4Sa5d+zBzNDf
	df6Tf2yVbzxyLvl+cN79+PGpn79g7V43CPeQrpaF9lb4EusNjKoSDCtY7VfGDpWpjHktsS4ry3k
	AW36rGkO3gT2MVNh3xMM4wIiBpG3S2OMgB/l62+o+oRmrrBB5JqRcdd1uAPwdaySyIbpZtGU0KU
	aer31NNCq24V1EZSFq01NYiBuuSZa9uLNCEK8TAha+Q+fUn9ywSPCw1JMqp8gDXI+gZ7E453N8V
	VXOxnpW19yRWiOgvYskrs0bibWfc9SPggwyc14A==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr19587443eec.29.1793681239614;
        Mon, 02 Nov 2026 20:47:19 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:18 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Input: apple_z2 - set default resolution before parsing properties
Date: Mon,  2 Nov 2026 20:47:07 -0800
Message-ID: <20261103044708.2461481-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
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

apple_z2_probe() currently sets the default 100 units/mm resolution on
ABS_MT_POSITION_X and ABS_MT_POSITION_Y after calling
touchscreen_parse_properties(). This unconditionally overwrites any axis
resolution calculated by touchscreen_parse_properties() from
touchscreen-x-mm and touchscreen-y-mm device properties.

Set the default resolution before calling touchscreen_parse_properties()
so the default resolution remains in place when physical dimensions are
omitted, while allowing touchscreen-x-mm and touchscreen-y-mm to
override it when present.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/apple_z2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 271ababf0ad5..e7863f8f1d5a 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -397,9 +397,9 @@ static int apple_z2_probe(struct spi_device *spi)
 	/* Allocate the axes before setting from DT */
 	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
-	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
 	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
 	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
+	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
 	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
-- 
2.56.0.385.gac671c819a-goog

