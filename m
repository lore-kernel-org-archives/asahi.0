Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62550221448
	for <asahi@lists.linux.dev>; Mon,  9 Dec 2024 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742462; cv=none; b=pBKfrboC/wN0WAv99d3b7nYkeBBeb0QWQP7wjH2xLukHI2ZfFfNcFXtMJI++92kjvVY7sDoKg02THVkB8Qy6Swjwxjap6M9qkwgrYNzRuznE//ec0oCWwkHh6+2Q7mI8bhxAchVTXkd8Vr0jwOKZDZSBIPP9PDk6mcQygE/xK7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742462; c=relaxed/simple;
	bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rs9eUqcqef9Y1f0OI/gIudlfK3aRruV8TdJfUwd0Tg5OQOvmeBwCXrMLoHeA5VGKj93U9DMoFOm8OQ6CPB+KqOwtdDGcENklYkPa6ZEpFHKLznpiYiFtDQqQrpLmrCqhIvlpaMXLEAAgo+aVZgXY5Q0OWACS6eeF+bAJ6WdaT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNL0eYAV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNL0eYAV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2156e078563so31557765ad.2
        for <asahi@lists.linux.dev>; Mon, 09 Dec 2024 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733742461; x=1734347261; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
        b=hNL0eYAVKh2wycpuN5xR/2y3suF/FmnJTDaRs1I9+PlSaYOHerx0urKa1ndzMGj8ff
         9njhYonDj5ltSQXuVpyv5TXGkld50Ply4eLxcrEYpycub3OtOBDTrZ3MZ9mf67gTj0H9
         EMI64MGI/ZOWpofywstWxin458zhbrJ58wKwZGK9/YYcD7xTOaJB5tW7/GMtdpFsOkbf
         rMEIbkZZArZzQ3SiERtNDn8ORD11ls/L1AKGeuK9PCBaCtJu6BwUMMKYpNSbXonienGg
         QI1KwP2K9NjdEIRC5rRAYal8WWvG5uVanCdO/KpSsCngfUyCQmRkkK6qpB08bQo2Lol9
         aKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742461; x=1734347261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
        b=F3R+oLAUFHbBLhAAZiBoGhihFhBKvAxxJUzvA4bgQqcupy4LsLz6ngQVrnYp7Ce4GK
         X37cLE202fNRz6MsuL9JNWvv1vzIcMHwbVhkdMjpXogWStgtgpevM50rIcQZMq6NnznY
         0rd1gMtzxsu/Me8zElUCykDJV0rWtomqK6j6JPiYtLj6Gip7WdvU7Pr4qeEsv7rPqD56
         Z7OqtvM2hKFjLxGQIST7V+Q1ycpjtXzDrsLd+zJqFEqSHZlEmbeSyWTG9nXsmpVVJzbr
         Gplkjej10y8lCEiQtyLxPYbhGXCpBcx2ns7elVTatJkpqdfwRQoX7MHfBOQE6pym3D+K
         znwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyB8X7Z1Ptj9JQUiwYRW8lCt4vqDD28xksihipXUlVLRdEKF4mYAbemIgasCH6DbMN36VyYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxX9j9f4v1dvpRMkwTSGMTqLg2xSJQ3ISEudunyVToVXRea0v7j
	DhTg9wONble70m2ORXhAGpv5Izo62ncVrMXEUKjI8mjjBqBJJDBW
X-Gm-Gg: ASbGncutgDf9Gz4U70ho3R/+ZhiWnMJ9zLPfmVJ0wOcVm+NqVGYp3ZzSkAqZmhhAFUm
	IyE7fOARfhG9W45412bqkoWFtbfPFDJLrS8JPhTdx7XTh3wVhJpdzAFtCr27an6mDHrv6xtxuom
	jsalHxNecPp8P0Y7CJaF0O9Q3vxFWE5nb20dHm6FkUNLI+/25Xpl9MtuklY/+Jc3VfeqBAdMnFo
	3p+ywnaI+YSLpCOwdauBi+Y8Hg669lZ9DJ3D9Vs+0FrjWNZeF3E786cuQ==
X-Google-Smtp-Source: AGHT+IHE+t2Du1WqC/+jnVLPWSG0jQUPMDd8/py9w7+kgKS309UwwhMmDAhAU/gz6Yfj4oBXSzHyqA==
X-Received: by 2002:a17:902:f607:b0:216:4883:fb43 with SMTP id d9443c01a7336-216488401a3mr47732355ad.32.1733742460654;
        Mon, 09 Dec 2024 03:07:40 -0800 (PST)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f3188fsm70017745ad.265.2024.12.09.03.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:07:40 -0800 (PST)
Message-ID: <494a944e-4088-463a-abbb-c0a8cf4455ec@gmail.com>
Date: Mon, 9 Dec 2024 19:07:35 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-2-towinchenmi@gmail.com>
 <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/12/2024 17:16, Krzysztof Kozlowski wrote:
> On Sat, Dec 07, 2024 at 09:03:14PM +0800, Nick Chan wrote:
>> Add the device tree bindings for backlight controllers attached via Apple
>> DWI 2-wire interface.
[...]

Ack all the changes, will be in v4.

Nick Chan
