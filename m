Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589E1514CB
	for <asahi@lists.linux.dev>; Fri, 31 May 2024 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144641; cv=none; b=sKiPWM6dRfCRapocMsd9fNmbF16W6LM3HLY/U79QsAFDQGuvo6kegn8GfX5bETR1fRumqUXww6HY8qXEiFki+trwzG++Qu+YzaZI9NzAAKNAM7bAIXNdPZIVG+FnYeXE9Oi48NIXckP7w8qvvjr6oOAsIhltmQRCugq2SE2zcZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144641; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abdXR1P+ihPugg7FwvrYHuK469K9f89dnUt8XlAGc1ISZ70sCesgDBugrgU3/dvm7xSanWc4PeYv3CUig1Eq/+aCsfKn3tnJU3gJDpAa3GRjxyozQ9Rx+zIzbim8wco/DOyLYYvM+l7qIuHWTHBoRFBe+N65iztKubBYZZOPuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42129d4e7bdso809605e9.1
        for <asahi@lists.linux.dev>; Fri, 31 May 2024 01:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717144638; x=1717749438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=A/BazCUMr0rAUplpZ5sP7FfrheKvqHOoycBBEx5nI0OeAhAhLd5opT/emEopQIY+Ss
         xrEGQVbPiqUJ2mbc7JoLKM60/QWz1HyB9JS4rB9jzcJq8m7Hzot2ST34rIvbhz2gs2eM
         SI7PZbGnB4wMivI3nDAdsUIpwgSQnL5at6WB2VmBgkWFOR9/+lHx5xg25BbDHomY7Zfz
         ZTAZvHbkxLTaJX3GTwwIzkiG9c5nB2010di1se+NP5UApxxdYmgQzXuLY/VytVLC/dX5
         WQnR2uGDOnjCBE9Dowu+on2RD9eIpyPnSSRezJi+4SH/z+mbXr4Y3nM7AP4FqL+rIXVy
         yydw==
X-Gm-Message-State: AOJu0YyAQIHOwXOuq06uB7h2XaMTH9DUxvmJN8T/7GG2pU1iP+VjVRce
	bOvvtqoe3Q84LcxOUcRc5/+bm5hV1oPOeXw9FaMO8wq2NElHDEpn
X-Google-Smtp-Source: AGHT+IEcMZB90PK3n/9rMQxD7m9IN3Nt4bzySZUbYfywqxlzdNOgXH/47NR1pw7f8r7XCWcMKZ23iw==
X-Received: by 2002:a05:600c:3b0c:b0:421:2918:3d9a with SMTP id 5b1f17b1804b1-4212e006132mr9155745e9.0.1717144638185;
        Fri, 31 May 2024 01:37:18 -0700 (PDT)
Received: from [10.100.102.74] (85.65.193.189.dynamic.barak-online.net. [85.65.193.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8afe40sm17955285e9.40.2024.05.31.01.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 01:37:17 -0700 (PDT)
Message-ID: <746bdba5-8826-4069-8f3b-08891d78321d@grimberg.me>
Date: Fri, 31 May 2024 11:37:15 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-apple: add missing MODULE_DESCRIPTION()
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240530-md-nvme-apple-v1-1-b8b7ca569660@quicinc.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20240530-md-nvme-apple-v1-1-b8b7ca569660@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
