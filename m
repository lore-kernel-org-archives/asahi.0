Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95970265CB2
	for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303409; cv=none; b=d6ol51KclYu9rUdwxbW26uwe5Cw6iFCyB/oiS8T8+f39aj+TSSWoMlSWbiOtv9m5ESLs3rSG5bsKNJyc4PyDueP/Zuoxq6WmZ0Vq2RHxIABlOCTqJYlIohoJ8gW0Ct6yh96ZjSIo+3TTAbTfU6MJEznwAhV8hVyPkES9BAABX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303409; c=relaxed/simple;
	bh=4Y+wde6FTequXKMit8DFeMHtsKviytt4h9vl35TgHZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H30UgXyvX8xSCDafih4qYr241VtBluQJ1MhLh/k/wONmX4l2sgPGhJy++de9IQutIRR7vKGTY2yWnBw5Xkk+6Ua5N5qEBOjNlZMfgf6fot03JFEkvoNwVoDGi3Q2PlmeeSfybL6vADeT8aBEa/l3OJ0nUrp2++KZHilFSJy6fI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=UKq2abKX; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="UKq2abKX"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-854a68f5afcso136562539f.0
        for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 11:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1739303404; x=1739908204; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsIvwEcUTBMStw2MMLLuDVcTGQeCcLwOBqA9S/j+YXs=;
        b=UKq2abKXhPOOLqGUXZlTI0ZcAN7VrYSAoyQOCc8gitNYbhSIPa6M3VtcOct7EIhnzb
         bUcB/I8I2szTK/NJYUsRxbvbkmXjwsAk2y5Nboe0BXmH+HXt4gnTwwm06N3w36pBFhyj
         hlkmBoP6UG6zTfFfJDpCnaKyayiH50tajkj1Tq04SzEbhiHKrGndwEzwz49JfTafBozD
         cjWM/PQiOazHYBmW2t28ePCmGvzdJAEEquIilZqmpD3y2/HK5K5MakQyfboIuy08rkPv
         do2kId8ml+l78fPmwimaXWzoYsRWkZORtU5gFNE/CNtXwcsosSYiD/ad7T68aOMNeLK3
         E08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739303404; x=1739908204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsIvwEcUTBMStw2MMLLuDVcTGQeCcLwOBqA9S/j+YXs=;
        b=kEUYR+EDFXD0Oe9dIeoIvV8xvdZYp2BmnTJw45OyrsJ5iCLJwp4z+FYp+QL/3CO7b/
         8FdpM2wE8FfD4xvA1YSGg/Abp4aITEZSwMlize+B+/erJTpfwODsFZvV9+K7EzBcsWdB
         BZbuM2L8Vj3oAAmyf0MySK7T4VdLBSMJgfvUBz45Nu+P9PuczX5CId4DEo/LRPWcUTLu
         dcOI4Va+Ye0TnENDSPsLqvuacGlDnXRH2UYrSsmObZM3ZhXG8m1T9YlN1cmjj8WSNdOQ
         kEEkHQ8cw1ZrWvCLDpT6s6g26G+5STKehbUYbVC4glVtQL5sN8FoTv7eqHGKNIwnhXhk
         3M3g==
X-Gm-Message-State: AOJu0YwQbclZOcqpryYD+uKdE/Nsmtiy8umuUQAC5CdEiJaJeSp/4/d1
	UiPIntZZC0N47Xyhu3uqtwJVq4QuD8GBMRY7I3fsTO8f0AiCQMdX6Uqrzs/X8ek=
X-Gm-Gg: ASbGnct04mjttgvJuLhE+J8I6uGDXDTXK+pTxBE37wYYnvKKAqvA0ikVGeeqfdeXg0L
	RVXAiQ9YNWv40ixM0mY2paJkZi4/VRuIE0w8ZKuzZsK2H0XCKArhSlCUI5sSdTXfs+eh2faGuKZ
	H5M2VGkejQYrUp2Vq539vI3/NvGj8BEdYBUbHpLh6Wbbucq5dyT9/szstXNCmT4flHfXxuANBht
	6ldNsqrhMBEaUgA3FGHHVt9Jo/xQehbcVIeorgV4NjHVeUWt/80vfoTphV5j5CjtlWMxpftNKIM
	g8VU5Cl4HWo=
X-Google-Smtp-Source: AGHT+IFrTVAEGiw2EoTh/b9YW5R/KtzW2+Oh2EsbSrKLQH+zV7TjtxzGKsJ/H8T6kpwj7fxcn/baxg==
X-Received: by 2002:a05:6602:14c3:b0:843:e667:f196 with SMTP id ca18e2360f4ac-85555c8c4eemr91680639f.4.1739303404598;
        Tue, 11 Feb 2025 11:50:04 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ed1885b085sm77104173.69.2025.02.11.11.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 11:50:03 -0800 (PST)
Message-ID: <84447986-6cd7-499c-834e-9aa01fad98da@kernel.dk>
Date: Tue, 11 Feb 2025 12:50:02 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] apple-nvme: defer cache flushes by a specified amount
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
 <20250211-nvme-fixes-v1-3-6958b3aa49fe@rosenzweig.io>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250211-nvme-fixes-v1-3-6958b3aa49fe@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/11/25 11:25 AM, Alyssa Rosenzweig wrote:
> From: Jens Axboe <axboe@kernel.dk>
> 
> Cache flushes on the M1 nvme are really slow, taking 17-18 msec to
> complete. This can slow down workloads considerably, pure random writes
> end up being bound by the flush latency and hence run at 55-60 IOPS.
> 
> Add a deferred flush work around to provide better performance, at a
> minimal risk. By default, flushes are delayed at most 1 second, but this
> is configurable.
> 
> With this work-around, a pure random write workload runs at ~12K IOPS
> rather than 56 IOPS.

I knew this one would bite in the ass at some point down the line ;-)

I do think the feature is sane, and to my knowledge we haven't had any
issues with it since I originally wrote it 3 years ago. But I also
think it should probably go in the block layer proper, as other
devices might benefit from it.

That said, I'm fine with parking this in the apple nvme driver for
now, as we don't have to deal with multiple namespaces etc. Can
always get migrated to a core feature later, if desired.

-- 
Jens Axboe

