Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460248;
	b=LVlc8S1q3yD2qV0Cx7qwtLb+ZEFW60PxMRhjeCfvm8ZTfXiz6RK/1Uo6cL4g6P8o5hP7
	 HKvL1ZbbHGo36zQgagZ3zelTtSdXwtP6leWBBvJIbAiQSIk1sPqsuyQdYXMN4AnOl0i1e
	 ZwpWBXfvU0jDQdDQvCiDOm8AG2qYylb+2d8ytaK7XUHj8j/3wp/xtAIV9/AcO8+svamuV
	 4SRusLDSFhgNkipAjW5re+v8l2h6M2ZgDsOLjs+0pa8r8vMwl3Zrxm03qOddWC3BCpIiW
	 6yx3LM+w+lL5tsCuJ6ye+xgIz5J3E88yDcnfD1Y6XQuzWTHjxPEZBrteJR4Tdp1hLkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
	b=N/PNy3Hk5F7ZLNBajAGHiqe4XL8Fu6Bmj7cfFvmYDNlYy6yMlshFn5uWddpZ/4utc3Z3
	 Zf5+1jky+oQ18MeaMrtU6p2vFmHRd2W6zZuaEiFf2KoMOlPWE9Ve0rNNdv/xWjXchEyMv
	 Fmx3BeWJWGaXHtL7BXcqlQb9J84E1syVECvsaXz+96Dm741zfrU08O7GE53VZ2Pm9x1yk
	 KbuoHjcCIT6j9cWUlMRQ/TE3bZt2wcEiVUVGoAByY3b01tC7jtn1UkIKdcctaEryRIlBg
	 N62hxAtyQSlz6oDmyYzbhxXr+uElb+o8OH9k900NY1wzMWtOmAgXRxz9jQJBNYJLQew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SMQm16JZ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E85606A321
	for <asahi@lists.linux.dev>; Tue, 20 Oct 2026 01:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E85606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SMQm16JZ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so954979c88.0
        for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 18:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460247; x=1793065047; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=SMQm16JZUBGApRzSx66+AjMwWkQl1HtYhTMhufKpjR6f9uCpvLbc4MQYyZ5Q/Y30Ee
         fn5cFmJrge0rbNRDwmYFtn6KN2EfKqUMENM017/O/+f53AYfpkIPxfMqPKxovpkLbkmm
         FhyfZC+RKjMnVODmsjMWDYC5197qXwxUw5C5nVbFuMPBpWVtF1X+znFU+2ECe4rCKdV2
         GmnS+6tybIK8P0EA6GMGI6quYsey+jSr112IgdJBAPriDH8L3JXVolgAL9OGjomOFlKm
         hzRQs2NRJXA+n2TP2cCn14Qdd9s0ExGMF/uD0gb4gWJQK4bRsS5XqS0uiCle4qYr/0R5
         fuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460247; x=1793065047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=RsUk86M3wCZgoCb3ywgwwpBkZPMb60nSGJUmhNMuOWoELrZwrHoWkF9YYN4YtHOJ8l
         FyeZWECBOq9wxjR1KYskvrro+llk5xEui3faftjJWsF6NC8I7QnpRThwh9KReFTMHs4v
         YvzgeXMdf/gBE3hTK6lfqzOeYF92dm4XW800NkrODEOn8Wz32rrpbRm2W1sQebTIL9oG
         3wQjFGiPYt1xgDzAIMBQpRaWu5utcAyc1HqAl1FSpgu6GW57dUYvFbmCZbMux17a8FJ+
         VDzJepxsP6QghpPeehDmHOp0INSs7m7yOP6gBnJS9i+/MV5uwxovUIw8qiBZjCWR13W2
         4FAg==
X-Forwarded-Encrypted: i=1; AKwUvBxsPzQEISymqkk7fLiwDwMgrHELx0f3PrFAyHqo5V7oteDvwZFAkJ+QDhxUKnnUd0c+I12SKQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLkuM1QzePkJYVwkbSHjz5JqLSxbk0sGNdP0x7NqTL8sCXnZjED
	KZyO3hC6/Esk7mLDzG1BxeczmPQjKegTpQt6h0hcBTdHl5hcMi16u4Ov
X-Gm-Gg: AYBFou29HVsnUbzL9SwiAH5D3Ov27Hio/fO4gd/EqyZAN8EsJa52Ki1VLLmsJ28L7dk
	P//f2DptsgLXR9ydM8k/PJaiUehGvnciLMTUg+WF9KdnnLTVlD0QghurKsQ75jlmCcrux8hD4Zq
	QK09fwn3pYXydw73NrkZbrtI9mnr6BUghYpm2lalamGSopKCrFKCUrZvb88z1sHqV3kb69Cnins
	8fgX7ucLC8EOoGwWJOw6CEn2oZyEZy4GfuAxiymdScCe0RzbB8xKxBj7LyoXiFA3hDAN3R3MT/P
	wOVboRpADik6WHNuwIgtjHjXjiUwtBfQztNerIZ4TZt7RlSUGYw/zcZatj1E56lbjLGEUpfcxBf
	Nc5YIxPTi6U2bU35Q2MH8fVVaWRoEwkOQeiz1Tc6DRUidVCjcW/29xoV1oStRn0vzj8LgF1dUba
	rlSPl335QAUpj41/5uLGbl8yGGT0/NeMk/WSaHWT9Ea1w6Li5DxRV7juIgI0P9fI/B+RA6kfzRu
	4EVSZTw6LmH
X-Received: by 2002:a05:7022:120a:b0:171:a066:938e with SMTP id a92af1059eb24-18512c384b3mr12193156c88.21.1792460246891;
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37626819c88.0.2026.10.19.18.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:37:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: watchdog: apple,wdt: Add t6041
 compatible
Message-ID: <1a720dcf-9f67-423d-b998-d0db73f82899@roeck-us.net>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>

On Wed, Oct 14, 2026 at 08:56:08AM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t604x (M4 Pro/Max) SoCs is compatible with the
> M1-M4 SoCs. Add "apple,t6041-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
