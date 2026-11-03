Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681239;
	b=RhdzRx8FnUOfOtNYOsknZU/Rfr3VAdXaeAg3nOsUg+6q8yKsYzbJoU+ENd06XctF35tp
	 Pz30MEVGViHkRPmhnl5mO3TkYonHszYUihvKj32WKgNAM2K4qKZYkwWFwkY8Ni1z/Rk6X
	 wfzi7sTQmnxfM7yNWpjMHB830gfZt12JoI285g/fnCXWcmKBlxBPfEdMes+Oy5+GJ0ONh
	 4XDN/3nwokzDEaiK9Hyy2MV77qD3HE/PxynqKPxtQxDgAbStffp05T9UZxgsY/BVW6pfH
	 knm0DLlZAcrcFNBvHgqUsNTkN2WfaOnn20Kv39APRztX35tdwx8qgBoznzHvOUDsWKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=;
	b=UnA6JdKXIoxkFWCr+w+dtErBAP/jX8D3jZ3q1iYExPXS7K2dPGjuQmdLA9WQoxmHMOkQ
	 pNXo3sRz1H+MZlNRpJ2Lb2TxG6pe+77MlGyjUY3TsXHe3MT4pVYQxK4skBxoqv9hG2r/W
	 Rnv/ysgEnQQ9yOrwMOy+3VYx3i1wzNY0SleaWNjk8sm4aok8Con2nIPtCMnnS4gj819+3
	 0AKNNPT6GjDWqUFXKnda9A6tBLwvQygnJcNQEV4WSg/bB2pOZqW569h2Wx3on1CpP6d85
	 W2DYEOtqayTvWtz+/U+knMQxA/SqXjY8I1+KrKScwQYSEejVn1mxlg/4unZTqqETDCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Zv6/rkD/";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA38606A331
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 04:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA38606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zv6/rkD/
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15943c9c005so2315854c88.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 20:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681238; x=1794286038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=;
        b=Zv6/rkD/nc4y0zH741IUVhqimBD5CQaEQEedNx/jYR5rMKMIwRU5Zj3ZslbhdwNy6X
         3grc+cS16yMOH/CRRggIVwtntICMmySwyCnCDzvLKDmwxjvavXv8Ovd6qiX8/ses4RwH
         w1nfphIl94b4xVEtj5M6UFi4QVBbZZzksZzdRdgj2hnCi9jOJOVFhC9mAjeRJAMPEC4K
         4bv7ZHO07jCt7AiSiVupIqyX3Ca04k8xPceCuVPk7A4RMAJ22VcEFLXjrDG/D1E4BEId
         UR26T5T7MRSwpJf6EFS3uLmdEFO0wHHkk95kjL/xIwG+JVkca2Iff+4nS6M2gz0vy+dE
         +sXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681238; x=1794286038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=;
        b=FT+1AYCDxoiVhjDRC9NL8J9xFqVwvlabnaYQ7o1Gc85taiLwyFCF5gMiyh3jV5CfA2
         4TDuKgm8Y7+dnpdMwI/1BGdNapJQsEbbv+kQebQProY0l/B6VBlqhqz2RUjM9Jo7ylPL
         TanjbjDkZeZKa+CNFVEr+04mKovELUlgH9PfBDsRrp++HMfaB3ysAcgFvM3GbFQ4BuuU
         /sA8TnMj6Jv6ZNWeDAM0r8GsbWxnhi+bGlbH+VNTFvamsU5eQEqMsO70d17PAuYBJzsv
         /hDmSkCl04xJI66e0yQTouaVpPglkT2C49A1dKBKN+4HMraWhQifR0c2iqkSsDdIX1g7
         708Q==
X-Forwarded-Encrypted: i=1; AKwUvBxi29B2q81JtqyCkLigp6M9pn5DTFPS3WK4QVxI7OhjGGsCyidS3nC8DCDV2OYnUGCiLjv41w==@lists.linux.dev
X-Gm-Message-State: AFq9FYLWPklovmbw1+JG6aQ5idZk+cBzDPk/SVZ6zuOQ2gDGBaR4NZ11
	0/eAvm7cMgyUsI4sh2DjR6dMmn8WUuaPt37oPKD7/F2uvBSk8M7EWFyp
X-Gm-Gg: AYBFou0LMh7gfIn6U7YiXp7b1IuqXFnOJG39/KRf7TnGtF5GzOkgq0tO7QI3UpwoSTl
	IJR2pW2/3+HFclGpdgoT0XVSOcg7v2IKTBuaKSEI/EddYV/fM1XePe9gnMpu5ywhEoY+pjrLYSX
	TPm0qEZxdp68ZFInz2rAGkXLyu+KNWmGfwKPhYJ9r7exYVWQ3hHHUmzzz3Y7RizHIu6UlgYUjLM
	SytgrFoHUmyxsNFPmjyz9g8Ug8Z7GizrCR3BdZF76lFpiZOdU1DhzWmn2duCJH15Y3h3NeKtoQV
	NGqMuSzAn72Lfc542N2TgkBhZ1PWfCnX6JWi9RQl7wxPYMxz10TQLwq2wb77CNnq2dUL472ajlV
	KVRslnVy8k2xXTmcT1APFfetGDDvpJ3MRmJFbgTm5w8xRnjIF9GHr81XAMII3cVtCQa0E6u51Nv
	YiHpvXd6TjZ1VDgONOrQwYvJ4dssIudAM1RppSq8Quvy64wVIpm+GRNB+7VmLf/21kLohGA3/Fj
	N+pKxSa8QvADLjOu006Ds/PMWX8Hj/BelxUT1vqeAMe/NFLY566HUlLn5LUSMC1erQY4zY+4b3W
	2XUbEzYeWGHtPIcS2bSUhDp/twWpLbQjVhl11UKXD833UHN4J6D/tpaR9tnEMWLuWD63vjAzqVr
	OuAGKV/T6u7KLHswf
X-Received: by 2002:a05:701b:4208:10b0:1a3:116:848a with SMTP id a92af1059eb24-1ac5de5424dmr17866007c88.35.1793681237912;
        Mon, 02 Nov 2026 20:47:17 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:17 -0800 (PST)
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
Subject: [PATCH 3/4] Input: goodix-berlin - set default resolution before parsing properties
Date: Mon,  2 Nov 2026 20:47:06 -0800
Message-ID: <20261103044708.2461481-4-dmitry.torokhov@gmail.com>
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

goodix_berlin_input_dev_config() currently configures the default
10 units/mm resolution on ABS_MT_POSITION_X and ABS_MT_POSITION_Y after
calling touchscreen_parse_properties(). This unconditionally overwrites
any axis resolution calculated by touchscreen_parse_properties() from
touchscreen-x-mm and touchscreen-y-mm device properties.

Set the default resolution before calling touchscreen_parse_properties()
so the default resolution remains in place when physical dimensions are
not specified, while allowing touchscreen-x-mm and touchscreen-y-mm to
override it when present.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/goodix_berlin_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index b0938a4f3fec..5cf453427eeb 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -626,8 +626,6 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
 			     0, SZ_64K - 1, 0, 0);
 	input_set_abs_params(cd->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 
-	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
-
 	/*
 	 * The resolution of these touchscreens is about 10 units/mm, the actual
 	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
@@ -636,6 +634,8 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
 	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_X, 10);
 	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_Y, 10);
 
+	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
+
 	error = input_mt_init_slots(cd->input_dev, GOODIX_BERLIN_MAX_TOUCH,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error)
-- 
2.56.0.385.gac671c819a-goog

