Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDDF19E967
	for <asahi@lists.linux.dev>; Fri, 10 Oct 2025 02:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760062946; cv=none; b=QeCSNmNQ0YPIPPW26s22dAMZkdhJy4N2aQWUrHcfr92x20jyTKuK7cZbA1QBQPiwPjl9k5iJAIKxPVmdzRoDSeda+yVAZ8tx620kgxVWNndhBsI3nAWdyL7XuZ95sMRWqcb3vBIRcawFmsZchrZSjCDBrH4GuHXx+m/n06yoong=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760062946; c=relaxed/simple;
	bh=Poc8CSat8DKSOJybm3/cRmwyiOaA5NMqn/oRePUZbI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXFGoYjeKdCeZS3biaAiplf3TL4pfeeplY4cEXfBQGfn1tWf5zfkJiBg2RL2vLVwdr3UBBDG17sH5WVgd73DEAVTa0cl3ehKACPRu5/gIAL8g1TPEdsrL2hptRhlhf0Xi5QcOxHQ68393YLlxlis9/cQQqW+e9zjseYdny/Cp1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToMA34aJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToMA34aJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27d2c35c459so11447995ad.0
        for <asahi@lists.linux.dev>; Thu, 09 Oct 2025 19:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760062944; x=1760667744; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Poc8CSat8DKSOJybm3/cRmwyiOaA5NMqn/oRePUZbI4=;
        b=ToMA34aJ8JpQTp8p7Z6CUGaYUmh+B7qah6BkSGR7usNfgnmcluqYMxEIUL/jkC5Ig+
         3cZKK8oMPN6Z7F+inrGkfVYCx5HOCeoGvDaGy0NuozKZA3yGCkIRH+IfEweSPVc0V53f
         1orumePuKrrAzZYfoPXAGaAsvV/UU/SY+1d2A3EWdJ1lKMIjR17JR3eERGhjMl9EeV7O
         rduyyJykXpgMZEhhyLITkE0EbhDG5DjV2I3t0t4Zc/vBULmjgG3rnoxW3rgHk6UEulQ6
         8XUQWVNVLqyIjTFyCXI8fcdI6np551jd4g0oix/GUdoWQTDFKRw1gBuOmes4/uKvZj/8
         ZEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760062944; x=1760667744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Poc8CSat8DKSOJybm3/cRmwyiOaA5NMqn/oRePUZbI4=;
        b=NTZ8vy2i2hen+TraCjX0g065Qdwtz2skszmEKw+S1cWjtGs8PhD++jFhsFCIe8G70P
         I8Z7bQqYw/yVciZq7hOM0pMNPCn0p+TZBaiAGMRsdIUmyt/a30XLr4znihGCu4cf9CsT
         lvqlFGlGrozD9m0EwUeIpQmZ3+qWCJdgVOI87yADtxaqfSFmC2kHSqMH29uUhPeCg9gZ
         yxwD2nYspTgoMWfWjbNkAC79U1vRuJcSA3J12epYRG8YiGqR5tQAvlw2c0XRqMaIXjah
         e2AqiGAbgpB2J6zJRgtLiXFnRqVEHqEILR7PaTalIrNEnrQOawKFQO68wZkhNZcRyEkk
         ojGg==
X-Forwarded-Encrypted: i=1; AJvYcCXVCbsMnQUg5OvtT2Ip6sNpmaE2zoVat7XQ+ecA4kST92d4dWXMZ9bU0heDw4ChCKPtdknnXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqgFTD7DfUU/8VwIeI5o4UvbPGhn34tTEJa91Gt+JEUcXd5Lex
	UY32g4uLC1CmgEeICcp1bavPulDYYcALr3x5T9k27IZsSTLOwdPrA7TI
X-Gm-Gg: ASbGncubhk//aBGsBNvU/ZsS11LwEgUmk1DypVvfVU5eTF9DjIeoZLz4sClVPN3AyxG
	9md4JXHIy7pdkLt/f2nj4iirWwzd4YrbpqeMOzDnvfTJZQyvw0EzUTg3cK/4PVhk6HeDZdey7fZ
	tD2jcYA+djxB02zdpFxYBn+xqDuEL1uuLnzc1f2yracng15SlKJIfO2+X5nmX99HV6eyoRC+7cs
	MKXjFtXi+yNqt/aTSkFs1axNKF08d6EOoyloeiRB4UsgEehZxsYJ7zBBB1uOaQbM/wPYIGDGaT6
	9PMb4UeV5hJKQEviZNQXhXxvru4vhB13Grx0FKY76RJ/Zx8HRn+3GfMvN4OMdAHGnfvthuFV+94
	qT8yYDeXb0VRsnT3cF50I1RmXbp2yQcGeTY3qF+5NdJsb1VNzBibb3jGQmimrm+sVM3W9
X-Google-Smtp-Source: AGHT+IG+Pf+n9YF9gI8OUfcmQ9dndEj32A/PkFqo3oluXmEOwiiZZVb7VASeukYYSqQxTR1LizxeTg==
X-Received: by 2002:a17:902:cec2:b0:25c:2a4c:1ca3 with SMTP id d9443c01a7336-290273448c7mr124825125ad.30.1760062943936;
        Thu, 09 Oct 2025 19:22:23 -0700 (PDT)
Received: from [192.168.1.110] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e18557sm41839285ad.39.2025.10.09.19.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 19:22:23 -0700 (PDT)
Message-ID: <28f4950a-e3eb-4a54-b867-67bd269b8407@gmail.com>
Date: Fri, 10 Oct 2025 10:22:18 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.17-6.12] soc: apple: mailbox: Add Apple A11 and
 T2 mailbox support
To: Sasha Levin <sashal@kernel.org>, patches@lists.linux.dev,
 stable@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>, j@jannau.net, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-9-sashal@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20251009155752.773732-9-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Levin 於 2025/10/9 晚上11:54 寫道:
> From: Nick Chan <towinchenmi@gmail.com>
>
> [ Upstream commit fee2e558b4884df08fad8dd0e5e12466dce89996 ]
>
> Add ASC mailbox support for Apple A11 and T2 SoCs, which is used for
> coprocessors in the system.
>
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Link: https://lore.kernel.org/r/20250821-t8015-nvme-v3-2-14a4178adf68@gmail.com
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>
> LLM Generated explanations, may be completely bogus:
>
> ## Backport Analysis: Apple A11 and T2 Mailbox Support
>
> **ANSWER: YES**
>
> This commit should be backported to stable kernel trees (and has already
> been backported as commit 37b630a26d235).
>
> ---
This patch adds support for new hardware which is not just a device ID
addition. None of the hardware that depends on this mailbox is supported
in stable either. Please drop.

Best,
Nick Chan

