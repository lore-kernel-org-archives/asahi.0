Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8CC176FB0;
	Fri,  7 Feb 2025 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908824; cv=none; b=rTqrUQxNQ1r41c+DeU+5t+R5CXGCZxidl4BXMj8pFLS9/57vSvEMxxuv7Ifb7f9xDvOS4V9/DArItL/B+huTCBEzToaQqjBh6Dgw6EiPDQbC+GA4uXf//+EvdWS6BiN0pCVvXRbdWVF2RPIYhKyCHGz1+9lDry6oqJCN8Mp6Gt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908824; c=relaxed/simple;
	bh=dpaZXi6Uy/hcH7ftkBr+q4yRqWSwSq17UhJiP9K/hvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTNuGjsTlI74n5x7I8sZsqzSRfEXZVH7fj7uYox9tmipBDLdKQFE3T+DqA/vVYWnABRxhm6AmzgPd+00xAQqUVpXV6HvRJZm57ouPNLkJ/yX7TzVQkLyjzM+staswuZmR43klRUKfJkBKtzxyhI/Gg+0jWbC5+unxilwKs7HwcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbjQDeK0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbjQDeK0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f50895565so5196255ad.2;
        Thu, 06 Feb 2025 22:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738908823; x=1739513623; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpaZXi6Uy/hcH7ftkBr+q4yRqWSwSq17UhJiP9K/hvw=;
        b=EbjQDeK0yP2tZBpiU1nYXYLi0xoyvthc1X5d6iKbptxebOiPCVuhw33Op8jnI7utMR
         eb3h60S9bNponu1Gkgx3crW1RqRCAWs7TwaezXHkrGg/GwrWOjvIMk5OGAGoDVZvTAzW
         +baUMFnSQh8k/ADhAMUcwHq3kmS6KfR47P5qJrMl8Gs2Bawn6G9B+ZSKDLKaBw4OgKBD
         UIuOYe0u6GhGTSuS2mjTOjZuUZsPFewT+nb1I+r2UyaJQ/zWydnFTTeIWfnbLVONli8N
         JrCILocLLsS0nL1fi7WS+TRIrScg2qdWQN9Ean4bmor+cLlyAFi95KEGH+tf7qd4gIWK
         Ug5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908823; x=1739513623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpaZXi6Uy/hcH7ftkBr+q4yRqWSwSq17UhJiP9K/hvw=;
        b=gRpwADx/TG2g650/nIUEyMqpAj+4BQy83H7doDlD2bOyeEa/E99z+ewvJoK9I8n1Dn
         ARq9ekE2AUZI7oz2UZQuNrhVJmSE3G+zCSBcGpHQvd34qdU1qjrPDArKvgiLE2aW5Phv
         ES/uY75DnVDC0UMkSurYCigyxwxIyueVPkIIlg45Xd7szMbst7ZuuwonXxnoRWQvcv/w
         Fq5VZ3wcIdttVnHECiq+Tcj5+4V/YusIkWt9a+1yIfmAV3z6zg5Li3CnxZLv9eSnju9k
         w/iFI2vU1RhOcppDYGBvWBJ3BWaMO1akRFjr2ZUcJSMih5I9iRS9JhrxLWlfLtAJwbfx
         zFQw==
X-Forwarded-Encrypted: i=1; AJvYcCU9zAjJtVNtphrg/yOi2F810YKyWVv8CG3F5ttKmr4uj5KxWrETAXLZ2OsgqpFcmXy/xjlx@lists.linux.dev, AJvYcCWKUb5zrG7UuUdIZy9VOwKLp6cGCDUI8gJzZgrB75Mt7IfGhVzDKkKddc0O51PftNpBOOqClw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm7a2l/iVsmmo8R63vagGK/jMIC+hYIV838VFOZZFV38NWJUT2
	0Sc1xVCutcVcThUHax+AJ4Kh7Y6+/ATHzx1K2uc+wbB/P1A25Ats
X-Gm-Gg: ASbGncsS85H+8UbaHpkLwztq+ZoZf9/fgZ0U1JTE98vl09+VKQBJhDW7gHWkv/sLEcq
	qs2mo9xeIGzmkzf+OJcK3pvPH6DTRVmH0w65cnrfL27r9SQW7mP/wPNmcLne7IJYQ8ilW5rkzdp
	PwAhSh0f+8oAy+Wrs6jRnsXw4MZDCtL/VTBz91aoub6p1bTDcKrhWqzFEhMH4gGMnobLtRyanm6
	MmwK6Ij2xmpCxn9HM1eUgh2zzrUgguD5sAG/fim6dpsuOYJdR/iHlsggO+exSVjjMnRJvg7eH+w
	tc7Oa3aoxNdczIH7n6DGgoX5KorNGOQ=
X-Google-Smtp-Source: AGHT+IF4EkR2ivum3VmCCnQST1j5wS2JtDBDxrrrHIhvikkKNyJhNf7xmvHNcQK8Y7WFxmLFlh6IAg==
X-Received: by 2002:a05:6a21:170f:b0:1e0:c56f:7daf with SMTP id adf61e73a8af0-1ee03a21dddmr4313077637.6.1738908822661;
        Thu, 06 Feb 2025 22:13:42 -0800 (PST)
Received: from [172.20.10.11] ([49.130.99.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf13absm2255060b3a.114.2025.02.06.22.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 22:13:42 -0800 (PST)
Message-ID: <f48c3c74-5693-40b9-a869-577e2fbb5069@gmail.com>
Date: Fri, 7 Feb 2025 14:13:32 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove myself
To: Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev
References: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hector Martin 於 2025/2/7 凌晨2:21 寫道:

> I no longer have any faith left in the kernel development process or
> community management approach.
>
> Apple/ARM platform development will continue downstream. If I feel like
> sending some patches upstream in the future myself for whatever subtree
> I may, or I may not. Anyone who feels like fighting the upstreaming
> fight themselves is welcome to do so.

Hi marcan,

It is sad to see you go, I believe there are issues in the kernel development process as well.
Aside from Apple Silicon Macs, your work has greatly simplified the work
required for booting Linux on iPhones and iPads. However, Sven Peter is still listed as
maintainer, so for upstream purposes, will the https://github.com/asahilinux/linux tree be used
in the future,  or perhaps the tree should be removed from the MAINTAINERS file as well?

Nick Chan

