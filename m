Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F81625484F
	for <asahi@lists.linux.dev>; Fri, 18 Apr 2025 04:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744952076; cv=none; b=bsAQult0G0nQ737fBCdj56vXuHOBjiDznxBH3v08bqi6xhgewBhrDXOGaS3OarS7B8TM7F5BAKiZwbsNvzvXgjaFuCEwq8nRXJZK7PeGT9vCX5mRT43sKpBewvtRYUexq+nYZcQwcg748AQAgdoMXu+OKeWweZZ5X116pSHIuG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744952076; c=relaxed/simple;
	bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhMcWjU8LTmA1qDcQOa3dYelhqWblGrkhxtKezLfEXwOrKs2d2/Xjm+gBp9jhLfi2pSGl7INfPR3XEYiKg2RFfB4s0zUYrdJM34bcMcQZ2obe+qZXtVG8JTkpnak/yjFTWzOlDtzDpwEhz1EAqf13j4ohmp/nrjjzXnKZ1OwV28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5vpATjV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5vpATjV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22435603572so17447865ad.1
        for <asahi@lists.linux.dev>; Thu, 17 Apr 2025 21:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744952073; x=1745556873; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=;
        b=U5vpATjVjUmV6h72VLhiMwTm+SHMiM9lyGk6829vuvD1TErG5Rgd9dgLkocKKLB+2O
         teslcNavx3TAw9Ha+1YtvC3TTp17ArYDxX1dxMuyPywg6Fme5mZjA8n+HhZcEnWxOhvo
         5nhMp1y7uS741gfzvjK7CFOxnMzankPBR+PAjsEpbXkx2FSqaNefUoUnEIxJZvhKPmS1
         xQzlauJGigWZz9ReLhVksbaUkA287aRidiJHPd2D+o7ZcHO9yRXgoKLKjGgV6nvI/EHo
         c65wyh3IHU6KXWC9ZRtxf93DGxIcqi5Ry0swNx4biaJ8l6ZTLAY/QDbu2ElZQHPfJSrL
         Dbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744952073; x=1745556873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=;
        b=VpoiNN+Rxcw7cqDXHgi8JIEbpO/X/2uIsP9DOeZ75/4H1VJZ41Sx/PRn65FFAt5Ap4
         7sFQZMEOhQwo1iv/W3D//T2xyAIkz+6RfgYWGL9CqgjB9o5pO99EMDK5YVcK6fV6Is9W
         VhTiuPQJMedqwdzCWW40QX1vQ9TzRR65H9BYhritad5yurPyOsvaRM74A/kQ8IjIGlFm
         pElHHdwk2HngI8ND6G8gg7N+bSjJzXdnq0TiuQFioIBlH3TeTexDdQB9NncA7jNud8Rd
         gg89exI3+ltkVpfxtaeVfXFtAFtXk8gzXi2IF22A/14lM4PbLpJs7uXuA178wH5cNLuq
         IhEQ==
X-Gm-Message-State: AOJu0YyerXa94WfG2n4liWgekRWod3vM5f5nC5gW1uEDZ+IrUsBij1jv
	7owrpEQZGD4fbQGr0dZ9O95KfoDTYaoTBZoM0GUmUvC0+tNGKjw3
X-Gm-Gg: ASbGncva9vXYwTT5B93giAtdxDDD2vt3uICIhA6rmiKJKr6XDUV0g6ajerbHdi8FUeP
	K31Kn5oYE2Bnw3lzfRsXlpCEWQHzNI2ynn3J5WlZ392R9/SIK412ElHB6mdPOLLKnlXzmtUs0xB
	U2Tmw0kwmkXwSyJqe/Bgtc26/8L7QPs0nvLgJZEy0Mc0CGIp6DBtrHXX4fZDAWpHfYTUibe4b2U
	j2LcFTbgmdhDGvcu63r8IBazFx4jSpYTuq1aZbFVKBPJiYBTIF+IaffhzFpPZN5N0Fmfh5SOmyI
	X5THsYA4c7plMK+nofHKEYuNQPwws3Yj6sob0adrsywTkAn+j1xZiv3pz4VHUP+rlXyaUw==
X-Google-Smtp-Source: AGHT+IGV/fWbJMmWtA4WBhTr5NRFS7XNEqC6SndfF5cUfWSxSGh8GbNlHBkKJARuTfoFoRcRWxs5jw==
X-Received: by 2002:a17:902:f708:b0:224:ab0:9b00 with SMTP id d9443c01a7336-22c535ac5d7mr21475505ad.27.1744952073304;
        Thu, 17 Apr 2025 21:54:33 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf1424sm9178635ad.53.2025.04.17.21.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 21:54:32 -0700 (PDT)
Message-ID: <06b513ac-1734-452c-a967-de3c178ce80c@gmail.com>
Date: Fri, 18 Apr 2025 12:54:29 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: Add PMU NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein via B4 Relay 於 2025/4/18 凌晨4:14 寫道:
> From: Hector Martin <marcan@marcan.st>
>
> Add device tree entries for NVMEM cells present on the PMU
The commit message should say PMIC instead of PMU.
With that in mind,
Reviewed-by: Nick Chan <towinchenmi@gmail.com>
[...]

Nick Chan
