Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEFD2D3721
	for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113879; cv=none; b=g3QJtP1kAwY42XIG0et1SW0MAgMDc5vjEKVVqq4Gk7/hCpjA44LVpJtOALbG0C2UzLyDltMQnTid0nEmXo0nAwMad5ytClflM/LwAydSKTFS/l1X9C11Q0F88KSiqJ1NkxcHX7XXcBbKJPLFGUNknTdZKPbtbO0voNbd31XXQdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113879; c=relaxed/simple;
	bh=J+EH/7RDxPq+xAlt0TRQnGUGW8nNs7BWa86kYwJc8xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+A6CgG5cxZcy10Ua9uxR4hnTXZZLAlD3yQ3mH3UYJibHjVvpymNmAanpqb0+Fx5LfcVm/nhBprre68Bgh9MW0PS+19aZcC9KmmcGvThrqqJBCPshpL/QP2bdp0P/mgf5b0Dw/0qOj/lt4NFD7tmRPrgWB7/tMP9XVjK7N0VRy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dF7yPaHk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dF7yPaHk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-771e15ce64eso494278b3a.0
        for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 02:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756113877; x=1756718677; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sM4hZ1puiRHKUqzwGkov59Rx7fxdUJpK7AlV9haEfhw=;
        b=dF7yPaHk6zfFdxuQgxGZHPcjfj2e3MeonHhFd/TQdKEADq5tX5ggqO0PuOO+Vjc6kJ
         E+siaq3kEgzaSSTif1eUbB6iS0rlqBTwdYDGCyDrwv5iQLWBaDQfMYe+Hz88bj297DDW
         hKUWayB/L+wk9jqFGEOrWkRtkUwsUJOqz6498fMg4RVDpF8tlnk2LyB3Vi8PRd+6HcNe
         weuyIK8IpSS2WLy6odGZ3fFqdEWfjm4fGy4QSLS/J8jM7DTHfvedvcd2cdNxobsiWz03
         DSvir4O7on5nG19xD+H4mUCwGPfT3b2O7BrXsIuV2KraSF/zgH+HESaMH2OvnszzxyRC
         KoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113877; x=1756718677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sM4hZ1puiRHKUqzwGkov59Rx7fxdUJpK7AlV9haEfhw=;
        b=D6htQsmtxG3ZnjfK++rlpQWaZpAog8DalIEJxtW8W+1SHo2Irg1cqUg6gLCvC0fv4A
         HwXFigXv2Cb4v2ADMjwn/KLoWFr0q211sC3oYssvR3ba0c8AJUvEZdMtZ0KKWt4G/oUX
         rg4Ldl9fVeulD8C71Y/7volv7bs4eM1RSIs7hTQib+mdM9Qprg4LiG9/QlHRR56x8vMB
         NzpgUpaj/q2L0u2kS5HT7okLldwSagCrcjZO6l5G80zWFS5ZMWfJVZcN6Ov3NNKYIPLO
         1LKik/bi20Xn7LHsA9HaXq5wHNAKEf5R1PtXXWGzGSDKp88Y2XRh/Z08OIDyQqpEuTpB
         ytxA==
X-Gm-Message-State: AOJu0YxJm8EVp5JzLFDaTNm/Grb9qOLgI1suDp1v1GJOmfjprtTSN23L
	4frG/RVpEBGIRkVLuk8e2LmY7/MzvupE66/jQCnePgkTYLTtZW8DHkQ7
X-Gm-Gg: ASbGnctG/ginHgj4ZkNzsqPNoymckMjy6vi8iSBRnhbCIvQuHmermL34ajjWcH8ZKsN
	SC9ElIpqyiaqHZ8LPJRBiTinJNuHJW0k6qL5Siyy0ZDYAr5v6fvLcWJKTMmqSt3ClVvOrxUHwvB
	q8GnMKIkY5U/KC9f7JkIUwOXvuexzB4BFaSxBMgQ8tkxrUdOIVmFG014+5m4bfV5fcos5ZowW1G
	sDao1eLW7pmhwpg32O5zKVquslZ9iopa/GQHzrjoIn31ZSBcfyFp2W1oqsfjWMyCmJIPMq/rpj5
	EC/DFIvkV1Z4NHW7GShAM3YIBvmbBfGyNEpyT8hgXRZADa4pbaYveFaX9D5fvBGjTVnQtDXvTgK
	bJX6f7pUa7VNEsl/s7hYOLz7nfnOQ5HQ5
X-Google-Smtp-Source: AGHT+IF2Lj1I/oMHmRomgFUcdk/gVeJ+3cAJcySQ+eYOGXApg2tOeqaENjSgPcrhwsxhI+VbRT5g3A==
X-Received: by 2002:a05:6a20:7286:b0:240:3ebe:ea34 with SMTP id adf61e73a8af0-24340d2bf18mr16359852637.33.1756113877525;
        Mon, 25 Aug 2025 02:24:37 -0700 (PDT)
Received: from [192.168.1.111] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb7b375sm6121879a12.29.2025.08.25.02.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 02:24:37 -0700 (PDT)
Message-ID: <89826428-4a54-435b-b564-b0be49b8c7bc@gmail.com>
Date: Mon, 25 Aug 2025 17:24:31 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add support ANS2 NVMe on Apple A11
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <20250825-t8015-nvme-v4-0-6ffc8f891b6e@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250825-t8015-nvme-v4-0-6ffc8f891b6e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 25/8/2025 17:15, Nick Chan wrote:


[...]
> Patch 6-7 adds support for the NVMe controller found in Apple A11 SoC> Patch 8-9 adds the required device tree nodes.

A correction since patches are removed:

Patch 1-2 adds support for the NVMe controller found in Apple A11 SoC
Patch 3-4 adds the required device tree nodes.


> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
> Changes in v4:
> - Remove the remaining added long line in drivers/nvme/host/apple.c
> - Drop already applied SART and mailbox patches (based on top of
>   apple-soc/drivers-6.18)
> - Link to v3: https://lore.kernel.org/r/20250821-t8015-nvme-v3-0-14a4178adf68@gmail.com
[...]
