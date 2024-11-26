Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520561DB361
	for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732645557; cv=none; b=iS3Pk/5QdbosFBltcMdCTbfWRsymm0yDxy/vdtgkwu3va1RBdY7HwSFzBxbe2omDbYIQANWawG/hYhTyirWpzqzv3F+z9Xa5KoeH/3lVc94n6ogUxK1fEbFNbMDAqfAqJW8FKlTjLYz7K16n1RXJbb1T6dVFbytO0pA7GdTmkLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732645557; c=relaxed/simple;
	bh=aoBiFqPehAaj5iMKLKw4nSGmmuIy/JR8WRaPdR+Q9nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwVtTfl0DBxyDr2YTLtKJ90Drkiefv62Y4EB1lyZDOXw0gFrQRRqBMgxubm+Zldc7USuazkVnguCAIfQABRME3QVvhalMyAFM8guGPdVHlYVrJNhrwapJyMB1i51sFk8FtDpD6vgFqwS8zZfUDMP70/b8kpsM+9EJPmd8ikbHSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7CDGIRD; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7CDGIRD"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7251331e756so2097169b3a.3
        for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732645555; x=1733250355; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGO4VEjmMCTpy6yKK70GikOB6XhW54AbxXkx7kdm35k=;
        b=B7CDGIRDFA3G0ga0SXYnIbpeI9sthJ/w8AAQ3a/5yg43gzos1PP9A7rlpWuBYyxPp0
         EcQO3XMxFlBPXBU7bNfjj2FkTbaEDuYZBz63rKYHbYTGyCsDs6kMi7sBeha4c2VqyOMx
         Qg4fe0jd9mmJpvxW9Ox9xwbLY4V6muWrwPRHMZJ/5CgCoV+unnPujhJUroZ0GOq+9Qk0
         nFhES8o40ZhItQOIZ1EtuQQfWKgqQj/lpPvtI7W7rkq7GaWSrvxolJumwO+1Fm6MJ3O9
         S0IOZEBwSnoUAta03LXJ/l5+5YEVgg94RnZHYgXE8kH2ArHNs71bOM/OhYa4CJOIAEdG
         S4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732645555; x=1733250355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGO4VEjmMCTpy6yKK70GikOB6XhW54AbxXkx7kdm35k=;
        b=A/lyrJ41NopF47DtthVdSlswDsIKaX3imSI440XCaf/d/XseYXso0biorF676KbHRA
         a5Ah/G0ZxkUEav3x5vo2a4CzbOVNQGYzngVjt5gMuQYHO6JG8o0/Rq1wsbqh66NuXlT4
         Jc09V0QqGU8B4NVsUg4Q4CXFDV6UwP5kJBJiKz1Z0vFNCsNpTt5N6+PLnycII+cOdL7u
         7DGrvPfLj/tA9Ag8Tvzthq5h1cFUtLEQg7zmMUn5i2R2Bgi6s7G2/AN2gFMtQMqytqpC
         esBQbh9F4C+BqziPJBXKSAVfAZb+kCRehWAri+GhsAwQJplqEf5RKCR768Fz8wDPef6x
         wU0w==
X-Forwarded-Encrypted: i=1; AJvYcCVW3gltROM6Cb+e+OglTJf9X35tNOKCtX0udWTV774p4neZ/yt+ZhYrZAHRlVhZvKuKzNHVPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSTvmVjN56VMewQAk2ONgG7DkcjBj2TZX1KAhSGtcPX0MjzQd6
	z3BHC6sRvzlMc9S1e7l4yjgW4NuDypz6Y1NghEgA3Jjkr0o6uv/1
X-Gm-Gg: ASbGnctf3//TDLu9aqIMDQRQZusvJqOYpm/iQtf5uLpAT0cvBAIv7Lz3oqbGLVyIczl
	R0t/8qkpb8LxCwZ9YnPWGVnPaW6nmEc2/TZJ1IZRbWUB6pyTMB00Nq0c0m3Zp35aP5/5GwdG8g0
	Tol/kvbFpGjzowp0KgYsM4i3uNw2tmMtUptEU/P8HIvQg1IMjwBLmSR/Flo4MUDPw7GqDsOsGGU
	1M6yHWhMXkOsPJMS6GgG6HhqPeQs5Bv8nwVQGpXP6JU3//e6K8NCd3Q2Q==
X-Google-Smtp-Source: AGHT+IGIW8YWKhxplj7PnOWubg8KaT/VQiw22cMgLmX8nunNS6CMBCZlxtxFLFqpa21jqQ2K9VRpzA==
X-Received: by 2002:a05:6a00:3d52:b0:71e:cb5:2219 with SMTP id d2e1a72fcca58-7253004b06bmr165886b3a.9.1732645555470;
        Tue, 26 Nov 2024 10:25:55 -0800 (PST)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de531b50sm8971221b3a.101.2024.11.26.10.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 10:25:55 -0800 (PST)
Message-ID: <e0f78e42-6454-4855-9004-05d90ba6895f@gmail.com>
Date: Wed, 27 Nov 2024 02:25:49 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27/11/2024 00:34, Sasha Finkelstein via B4 Relay wrote:

[...]
> diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2cf2f50e9fc7329a5b424d5ddf8c34cad2ebb6be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
[...]
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mipi
> +
Drop. Not needed as there is only one reg now.

[...]

Nick Chan
