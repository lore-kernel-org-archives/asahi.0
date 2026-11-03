Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681237;
	b=npLcKzcvrTck0Ehuxd6zS25v/ahgobfQudlzAqgnSRZ40ACuBxE8GBDyZ7ZbcAVWQ7jd
	 wxe/X2M/LCt+671bWJxN5BkZ8d4JqoGYh+3IOFqK78O6UQsdbexGhLRqkEPejx6QBRoNr
	 oO7/dNHc9Xlz0kUdh06FWOV++4JOPi8/6qmcDe+IIwuzPbwPUvicESbF/18GJDA5phR//
	 xrtaPtdFJijWMQingl4/mxro2DTzgcMZSOg4ILwPuKW8nc4iOHv01TpAv7EnZgFlynKQH
	 V1xKSftUtqpFJf7nTjmhHaSbvUzUwYTvXmM4FZJnLu9fgNXMsfSdlhky22aKQPDp//A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=;
	b=zMOL2VxCRNH1puWIXOTtAZBV5ENjRtJRA94jyYDeJvQhcTVjPzvj3PHtvxM/Rvkg1Zw8
	 vTb96JSKsLOMU/yKLYE0Ja6f9x1sfyqPSVttF5JIpp52768s0GZwM+de7BzVKgb4sZE9W
	 v124D7nSLml9hxYYhHfQxiZ654B32JVIR45FJ6ayBAHVFvM2R0TpZDI6v4TOgrunYR4tr
	 u3rR2dmW9OW9aKcZp57oxAtaq7ARWkYamkkiqgmToVQjX8pKohakrhMOBzowZ6WSQiTqZ
	 nwDV8wGb3B8esLa1du5WYKIRTOFfSYCvxGDrSyX7EKZ/9HepoxKDIaOk/XY1JUQM8sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkRKlvq7;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E5A606A339
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 04:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E5A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkRKlvq7
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a17a332ecso5784492eec.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 20:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681236; x=1794286036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=;
        b=EkRKlvq74m/7saa+O+UugkkdcywYGNq50Z4jaU4OSc5S2nHEt5miyAPCOdnj/mFPIn
         8g5WwhNsD2Q+xMqeIBNkPj0i+iOTvM3e9kf8Jna0E0k4Q5/qMEblUJxpITuFRaoo58ZL
         ZYHidHHImf9dihlhoiIJlBXJXoYDjtu4RxKzTgckt6LCcu3OE5S60JYC8uC3MGplsFeZ
         m7xrFslB7Sb1ERBL0ueNLWIacz9fcRUsHQ+yxhfzJMXNwjJ8lCusGOK3APZb0Xn7kd2s
         SMz7xVbyENzvjhpdxzyewgHSFVE0PcBQtrb3Kircp2C7t8GYCuAhvy5mbvBD3NQlcLo5
         15XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681236; x=1794286036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNcXC8FQ4AQIGuVcbVq3SDd9KqNKYfDqhTIYzFzJ4J8=;
        b=D6qDIkTu5XiRg9d02gtQLPAhhiFl3rbXdItCBhD1M0BkaIo60z6SoIiej5BlJtJXce
         TRfiqHG7jCv00ATJZt18J93EbBMq3TIGFSugoVt/rBNK/Okc31lzRgh5muh7sUEX3Wnb
         shIU47PWisq3VCWZsAFD4fdVAHEV1IKmQo8DXz5r6Pu5ftYmpSIg3za0OujepzDnMQVh
         pRdHM77YQN4z5WsayHT+axp1G7jqZoHmKrepMqhHlQsg7B/w+9TC2WRAArLongWxiwMe
         WNzBk9Yjx6eGeEoQutEC38ss9H4kX8Cx4z77Da4/jVGCS8OSVAKwsXai4dAKmspzfM2j
         ZNbA==
X-Forwarded-Encrypted: i=1; AKwUvBzpGHCvnTzXUtR3fuHnHLSBlAK38hDqgCbdov04I//2y5xX12jtl0w5sHBylI23J1ADpH86Bg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+VrhvzRVq4e3f0PZa+0KigV2xJH4ftVhOCPinsWcG61dwWk9Dz
	Y+59SOZN7JaocjNzU5ZBR82GSAlFi4SzU9h1PBTu9wkCkkiDfdviZtif
X-Gm-Gg: AYBFou3QH75IZTRkw9RbFE5wYN3OxlvlsHFEH0FkN/F0FLMSaegiXKRMGiLiETrWQ17
	cEya9eZ/Rj9NpKt1+gLWImfyLP87Vz5P1FTijq4PDjPsdP1f3aT5n5CBymUQkOcwzBa+7sm2+9o
	cdXmQbI6sgi/u75QkBvCFUJDsY0SiTMrvettUDDxtIjzKUhqWiIW4i2dBXXr30crTNrRI1ozdT7
	9dABzrNgaBvW447HyfQTcsTzrU59xuQCCs/4Ey9k40dzNWrMEZAjg2Qp1JTkZB6LR6V+ZbyJyk2
	jUymCvebQv08Ni+9pU5Vy/4M+jI6puAiNbGHsV7WThog39+HKUAatNO1FDC5twng2UYvmOuaQgJ
	NQL8G0Z8oiu/ysirWsRZvacfO50PArA/bD7nXQEiEiLG0trYca0fprzvc7nMRUbePCp8QroMh2Z
	svBr1I0c9a+27uAZyV1nFx/+pvFZY6ej8uF6TlTu8+TF7DxOShJuKgzcgba1Jyo4YVsK9DRUrod
	CX7nNldJ7h9gqc0APjyrYKFJOA0Qwmjb8CqXTs/7slki6Q6Ub0IzRKPhMEiKLCj3kYv8R3mPNx8
	+yihLkC6ZXxV4B4v496qiEG685ID+8Z8FwAvf0xnI4w3/5FqXl/6bEBAtLLLgmDY1egMKJ6Itgt
	zJud6EUsSbeLkfnLu3Q==
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr21088734eec.41.1793681236195;
        Mon, 02 Nov 2026 20:47:16 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:15 -0800 (PST)
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
Subject: [PATCH 2/4] Input: wacom_w9000 - rely on touchscreen_parse_properties() for resolution
Date: Mon,  2 Nov 2026 20:47:05 -0800
Message-ID: <20261103044708.2461481-3-dmitry.torokhov@gmail.com>
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

The input core's touchscreen_parse_properties() helper now parses the
touchscreen-x-mm and touchscreen-y-mm properties and calculates axis
resolution in units per millimeter automatically, including handling
axis swapping.

Rely on touchscreen_parse_properties() to configure axis resolutions and
remove the manual property parsing and resolution assignment block in
wacom_w9000_probe(), along with the now-unused local variable.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/wacom_w9000.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_w9000.c b/drivers/input/touchscreen/wacom_w9000.c
index 4a2629a54167..51c5301262d3 100644
--- a/drivers/input/touchscreen/wacom_w9000.c
+++ b/drivers/input/touchscreen/wacom_w9000.c
@@ -249,7 +249,6 @@ static int wacom_w9000_probe(struct i2c_client *client)
 	struct wacom_w9000_data *wacom_data;
 	struct input_dev *input_dev;
 	int error;
-	u32 val;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(dev, "i2c_check_functionality error\n");
@@ -350,15 +349,6 @@ static int wacom_w9000_probe(struct i2c_client *client)
 	dev_info(dev, "%s size X%uY%u\n", wacom_data->variant->name,
 		 wacom_data->prop.max_x, wacom_data->prop.max_y);
 
-	error = device_property_read_u32(dev, "touchscreen-x-mm", &val);
-	if (!error && val)
-		input_abs_set_res(input_dev, wacom_data->prop.swap_x_y ? ABS_Y : ABS_X,
-				  wacom_data->prop.max_x / val);
-	error = device_property_read_u32(dev, "touchscreen-y-mm", &val);
-	if (!error && val)
-		input_abs_set_res(input_dev, wacom_data->prop.swap_x_y ? ABS_X : ABS_Y,
-				  wacom_data->prop.max_y / val);
-
 	error = input_register_device(wacom_data->input_dev);
 	if (error)
 		return dev_err_probe(dev, error, "Failed to register input device\n");
-- 
2.56.0.385.gac671c819a-goog

