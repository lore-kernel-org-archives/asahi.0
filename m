Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0B1F542A
	for <asahi@lists.linux.dev>; Sun,  2 Feb 2025 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738508741; cv=none; b=gI9uyg/ldp0IVYuovYZanpQdZsnWXI+f1/AOIEXWOha4ZxA2ZlKSvSCrhUFqB2uTrM7xV14GgQngdkIlFlGecmIHHt5ekAVVOnLbaAGNlNe3fkwk3i9AKPnQpkH6qkpZrzpc//xIDVUuxk9k4+y4yRBHWXD1A/FH195tX8CBZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738508741; c=relaxed/simple;
	bh=tEZLqYG5g2vAHQTRfubUjbbA4RIaMNwVte2RpuiwVqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4P8h6EfomYJ/F9ztR4ldFQiWPHWkPMf/3ybpUmKD055JYc2rBgBssMfn9et1mEo9vrvld4/ycWOpwQyRrsgaQRT0nt1UNu15v4Ahzz3teeWDhbzhyARkqKMb1MEQC00O3fTwF8IZSnlqeRFb6qc2KBJDLIwDBpX0tjFXNh1b8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=eOlm9Rjx; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="eOlm9Rjx"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844ce6d0716so263310239f.1
        for <asahi@lists.linux.dev>; Sun, 02 Feb 2025 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738508738; x=1739113538; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsPzncwIigCJWeSgsuG0FXasnz96a9gzn6HqogWWQug=;
        b=eOlm9Rjxn6OfKDKre+cpz5mXSmpNVUTa75UTyg+uRP65/z4VyYsejRf36LMgJbBK6V
         aXx0fcHjHD+d6WYXXKzaErD8Z/b1PVfQHYIqNWZhkGu8T+aEpLo2N0cdfnreBpYT9P/c
         S9c44Dy5dACPjoEoxSbTUI8Kr949w5ABL0GZL1hsO1S+dWiVptpSPtXE4VGdq6GGLvne
         /R2/e8ShN09xLsxYpHM4mcmaHRvpFIKCVlaLr0KEJRVuBKuCmnBuks5nOCi10YwC8w6M
         nrmcxxY/4E8p/kU8Mf5l94UEVgfB+x1J7cFUT+NOzwNG/0/qi2x0ljOn4JMXyNOEBbSh
         5Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738508738; x=1739113538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsPzncwIigCJWeSgsuG0FXasnz96a9gzn6HqogWWQug=;
        b=ZA/9qxA8FscCHh+NGe3UV1iH0gUN1NhAeydkJY2WD+rKdE+LDzwf/+M/Uf/RlVjhdu
         ymnzLHpC/rj3zwkGNhG6OEl5wSiy6X6DQKHTWcpB+23Vc9BVn/8JAQ6rLfW7ujXQTdPJ
         QTH5b4wa6+hvruo8cCsjvqaxv1uN7f0RWBKRhf1u6PSavIUhKvRsdpCs8Ag+2pXB6NkL
         bJr55wHhg4twKJVXXV16oXb7y/l+nzSZfgIQ+rSBv2qwIclOZgXKVzcjEbTxZ8xQQqur
         M+2qKlo/DEvQZTT8RU//MxjA1zlk0MtA7RPWqCPuNEjnv2rGQUVp+hGC1foGXqCrmM1X
         m8zQ==
X-Gm-Message-State: AOJu0YzLfBbtcPJwggCVL6ALpofTI12a9TEbYZ9z/ZSld1cuL5icaafh
	1LZszSyR82O2BZmadhkHXgiXEhjQFbyp2JOHbm4pS/WZDKEB0QC5ptp2ftZHyR4=
X-Gm-Gg: ASbGncsQcyfw4XHtjlOmgzuPBxdDZ6TZogg7jV6r63RTd+DjC0fSr+G93/u1n8pNFvo
	gBu8Int+fegE5ryKU4YiXKDzowdCVTyFlKCGAzWVp+f7QWXnRKIvrIM42ihHyy2w+rps8hDRvht
	lWKOSKcUAxwnsyEP0cju2Olhd6KLZodAhQRpM2W5xhvNdkauWF0JcFxYc6ZiwaDu0CvIZYqo9V1
	U2OoZe9YDlCC8hw6BfnzhqQKjP1pebdpVrvuIeI7BgmDFSqee86aVdyHXNHQkP/54CfvSqlSJDt
	xB2S/xOB9suy
X-Google-Smtp-Source: AGHT+IGtE/JLqI8S9p7eRdsRPG6dC9TP58pGT88bNKePz2C1yiBYPfCn5bRWwQVviJy5GovjAgOURg==
X-Received: by 2002:a05:6602:380b:b0:847:22a7:240e with SMTP id ca18e2360f4ac-85439fa6279mr1766967239f.13.1738508738494;
        Sun, 02 Feb 2025 07:05:38 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854a15f8394sm204030039f.11.2025.02.02.07.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 07:05:37 -0800 (PST)
Message-ID: <8f039c53-a35a-460c-a0ff-43f592caddf5@kernel.dk>
Date: Sun, 2 Feb 2025 08:05:36 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: apple: rtkit: Pass the crashlog to the crashed()
 callback
To: Asahi Lina <lina@asahilina.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250202-rtkit-crashdump-v1-1-9d38615b4e12@asahilina.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250202-rtkit-crashdump-v1-1-9d38615b4e12@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/25 6:48 AM, Asahi Lina wrote:
> Client drivers might want a copy of the crashlog to stash into a
> devcoredump blob. Since device memory management can be very variable,
> the actual devcoredump implementation is left to client drivers. Pass
> the raw crashlog buffer to the client callback so it can use it if
> desired.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

