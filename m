Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3E41487E9
	for <asahi@lists.linux.dev>; Tue, 11 Mar 2025 13:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741700970; cv=none; b=NvDTkmDRF1nfAv3yuxsj5f5rukpCb5wFtr1NOWRSOORVIEFKDVgVHM+1e/irWsJt+OVpbF22hAXLb087TlQwkAZk6PCIFPrIBZOeQHN8edIzC6kqSXVC2lUxr2k9Ph3n2dPRIEZZMnsa39mQkZSgXdvNLTVmkf/gHc+olUP295c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741700970; c=relaxed/simple;
	bh=szBVGBATHmAoxSvkaJnA2k09xrdAhYDfUBkWPhXAyTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RV6SH1GmwNytRhYspzVQIcxc8CQlmmJZqICoxNos5Y6imNa/liY1BKf5tw5vhckPmg4WF2zLPBw2H31FZyr7KlrFFo4qxa328ctm8+ynwYf2ymce0lnXgfZMHfPoRqirDPJOD0v26J4rWZQ4M1aYF2Mtg/3bJdV7Sr23QA4hI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=lIlgsK+R; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="lIlgsK+R"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3cfc79a8a95so14486815ab.2
        for <asahi@lists.linux.dev>; Tue, 11 Mar 2025 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1741700967; x=1742305767; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15FhpTy16DxiOxuCUjxYZ7HE8WR5eqNgpOkZavgiv/I=;
        b=lIlgsK+RwbXxeWdHXTEzf9PiPHb78GcjaXUQgc9+ghXO5WxUAZIO+FlzZZLzYdea4r
         FrCGHtl3u2O/HSEBb7gObXAhk4NuVUDTkUxMqBPDFBmQXm9KqBXjgCku8R3WamxXlwaC
         6cn2ggPpJ+0iUPBpGR0V/eixa2tn7s5erMW9T6/WtHtFadmd+ZpO0bDblcie1Q0NM+wO
         bQ1hyuRkmiRNTpejQ49qCX1PlVS7rjP4OB4dBG1yNSFr/191FotO2GVUJPFrn3NqGmH3
         eljFqzyAWAnL+LnrdI5P0MbIfbOq3f3ImzgFViZAV2LLeSnDqW9zrfCY4WvKovhsxbxR
         OWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741700967; x=1742305767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15FhpTy16DxiOxuCUjxYZ7HE8WR5eqNgpOkZavgiv/I=;
        b=LPiOqLSd0UB5CYNYkQQ7lsZIOE8uq+PMWEF2K0/NUBbJUJt/tHvV9iDQVByip1z1vb
         Y61JCBf2KWEINEV7VqaxDFvV2ce30N8HmkjPEHQrKw1kzmt/Pr7h3Rvkk553990Zad77
         zWpucVyZFkyzurYfp+RDFkUXZ20dMjfsxruYUPDABUfOHqpx80ae630ZF/dQrrYeuZdy
         SNNDu5gwuJpgUAxZqU94KIzTHCmy7l3Skehtzb/yfoCgKDJuXV39c/CrhrQr+YlMBrm/
         ElXRi9+g3jkKh4UoHf+JqnVayXvRanFkQKoRDsbRuHo/C8JjiHLtc4nDrBkfUtoE22Oa
         F31g==
X-Forwarded-Encrypted: i=1; AJvYcCXBy3qGN1LwmysdncPwz/a9pVdLozsw/oChHIisSBVuu7FQFnVuWlvwzA4JRJhNSUunPOlvVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKHHcd+zH2oJVuJfsNgQckVQWVF/3W1RA3AkqdCvgfIGRiJz6l
	cpacgpuiie5PUM7VFz5k71N5LjwSi8IloYv35vO7yGfHPC8hBJqONdylRa7StIk=
X-Gm-Gg: ASbGncsIXegjpqnLEPLqf7ScxQC5Prt/hPFFLc/GKTFMvxzX/KcmGBs0MW764xFbhlT
	WbYnBtZWDRMdNNFM7EKTySZ+gt9mm7Od/L6CwJIS2vNYf677EQkT9spdj9QWZMS4wiFMcNolSGx
	67uG7MbDISv2uM6lxd6SiZ7Lbsq9CuA1im9koL/Yr3flF9X36iwa4QIuqGHU87d4Ry1b9wEjmnQ
	AYUrhCdiNfDLR+YY9R7bm3eM5sVxlWlgvEOQntJ+/YOVd2ApDSPYrQlEkdmkm7xKcRKS+Zp+VDw
	afKuW9r0s1s1H5aTdG+QGZqrZNhINwxhm/Hn4Ezh
X-Google-Smtp-Source: AGHT+IF9VOkMgxNVu1F60lVcFqCfcpKy9OE2LoUEIM37eUdSf+tjRuA17mWqs6+fEo7uJIQmp36ZSA==
X-Received: by 2002:a05:6e02:174b:b0:3d4:2a4e:1272 with SMTP id e9e14a558f8ab-3d441a46c62mr203305475ab.19.1741700967289;
        Tue, 11 Mar 2025 06:49:27 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2221c1d6dsm1925186173.95.2025.03.11.06.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 06:49:26 -0700 (PDT)
Message-ID: <3369329c-13ac-4b18-9923-1a24e1243035@kernel.dk>
Date: Tue, 11 Mar 2025 07:49:25 -0600
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] block: nvme: fix blktests nvme/039 failure
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Sagi Grimberg <sagi@grimberg.me>, Alan Adamson <alan.adamson@oracle.com>
Cc: virtualization@lists.linux.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hannes Reinecke <hare@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20250311104359.1767728-1-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250311104359.1767728-1-shinichiro.kawasaki@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/11/25 4:43 AM, Shin'ichiro Kawasaki wrote:
> Commit 1f47ed294a2b ("block: cleanup and fix batch completion adding
> conditions") in the kernel tag v6.14-rc3 triggered blktests nvme/039
> failure [1].
> 
> The test case injects errors to the NVMe driver and confirms the errors
> are logged. The first half of the test checks it for non-passthrough
> requests, and the second half checks for passthrough requests. The
> commit made both halves fail.
> 
> This series addresses the test case failure. The first patch covers the
> passthrough requests, and the second patch covers the non-passthrough
> requests.

Looks good to me, and better than the quick fix-up for the problem.
Thanks for taking the time to do it right!

-- 
Jens Axboe

