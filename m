Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAFE3C5DD4
	for <asahi@lists.linux.dev>; Tue, 26 May 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813447; cv=none; b=Naobx+4qhCyxr6K2RulZHkZNYwt/hohiQ/GPwoe4AxJtqgmWiRpob9LzXu/9GFz8dUNYy9+FfJVWfLdnzjdI4n57B7uYAys0lYhrMdWA9qGq4Bhwo5py1Ejf/wY7bkKYB2gk8K0hDXcoO7eIYpllpAPpnscwR7M8RhpoTp3nfkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813447; c=relaxed/simple;
	bh=2EeXpqQDt+Fd1xdkcAs9Zp3fbvTTh/2xP1kDKJJar2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IuPIZ6zIjMLPBdeFhy4CZVNyvL6eRWQOxTUK1SSsQZ2OLOp6rv9FWrDqqruURTw/HdcpYQqt1R98aeUjCxDJpsL5R+dh0pEilG5hKmV2zYKXX/bZyM9ZPB/NcakH/Nm8p7S4UpCjG1rY4U00M0DyAMjc3YiHx9xZHv376tlBtSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=SU3ThnVC; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="SU3ThnVC"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43587e63a8eso6808619fac.0
        for <asahi@lists.linux.dev>; Tue, 26 May 2026 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1779813445; x=1780418245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=;
        b=SU3ThnVCPHlt4oT8byLdn/GYrZHHWbdZLZef6I5gl3W8ljD/ie1gZer0bKPDtSwaXK
         dkDDd7sR7f5VwfiEiUcyNA9pqDzbYM/8D816YEYMJwW7RYGrTuIpBZ58LH4u9jNTqIXo
         yrYIqOklA63TQXfAazqY4ckJCD3y04RIR2CsdjyyJPBP7F3Vqxl9SzgDJ8K8KwjVWc4O
         C09KVlPsKWMsfKuaLGYPUxYCPMKgmrrQgH1Oqbhy5eDmeb6K94Hpg1ZGdGNDcLfwFju0
         nsx/o4sYkvPlBmlSnBHEivDCGOwwb8SiVqRyw12gaQdl2Xj2u9gwmdM7T9YG31ieSJJk
         chFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813445; x=1780418245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=;
        b=GXD18geJNh4K82ABYzx9f0A8eHEgvdEz/SiDb8sFx7G1Lgs8heu30Jlgx9MirxTTIb
         /DJBNZwDrVT6AyjRV4fxlMtvwUAk+wM3zSYpu+GCsu/Mft3z2qlxNwn7f/UJCtyuKaTJ
         3y9bSHrFQEHkVD5RgXck3mH7HTnKwFZ6r4rQpZvXvRnpyDIT3vdBHZIHhkxjHhfe1E4s
         UKs91xdTtoTe+c7Yo7U/932TjxNBpeGr317ShilXTce9HGBA8eH52o3M79OjywXPhA+P
         zscqCX8VbQZecJ2sVA5R96p2HXc2XzUe1Wv4/s2MBaJZLf3o4zE5LLs7B+mUUYR0a2VB
         biDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jodzVaodE1mVO+Gh1NLzrxe+9kAuBQW43i3JtGtiGOVde8OBcOCBEaXg11z1PTg+ylek9Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNyIE9aVtDKJwv/ZyEPTmiYusMCTeuAabPq7iapJv2Sdea9M5P
	Hro8QWmzH/fxE7/dh5NhfFGRI7/2Zyw/zqsYFTY2s6cgDSFtXRWBsYdtAFBYChwsT3Y=
X-Gm-Gg: Acq92OFU1Oh5DDSQ8YFigQxMFjdEhLG957DSbGmJYl5YDvfTNyzuEIc8CF+y5XfUP75
	qj068yNV3PdAnEZQct1CReuu3LuODgn1sJp1ROKH0IfO1sLS7LA9bDsFdcl4CLNHVieYxyMYyeo
	i/EtAu9gyPRCP1LegUIGTk9hD5Q+SwSvoNN6lpMLvdVMa1SoNS+Z++k5j5Vck43dCSh4XIDlQv1
	rb+YsZOAfhrSqlpTIosJE5zpiBjEH/D2Nd7O4lITSDyCu0bEbEYdq/kBwTajtX86GfpD6/zDImR
	VuIVC9cQ9tuJUTck0MXzwmOX0mw45REVGtzfpt45f9w5bOvuU4j6kj1rL4NUp2MmnZkRJqvhs3X
	n0MBaRY7owvBa4/ZyRuj1WPMWVoX96slFeZPkazeFVvl6ZLUUpeva070lcmR7BY+IbhrcDecYno
	geeIu5K7iKV+GX68UmzVMCw85qPgOr9UxWqY/4Vs3UsOLfEMGsYKGfRDmngGhThnfGLhALw6ekR
	RKEgFqKvS9YuHcmu+B6p1RO
X-Received: by 2002:a05:6871:289a:b0:43a:5cd0:db00 with SMTP id 586e51a60fabf-43b5adb7a25mr12258063fac.23.1779813444777;
        Tue, 26 May 2026 09:37:24 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b639fd7adsm13561265fac.14.2026.05.26.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:37:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Caleb Sander Mateos <csander@purestorage.com>, 
 Sung-woo Kim <iam@sung-woo.kim>, Josef Bacik <josef@toxicpanda.com>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Justin Tee <justin.tee@broadcom.com>, 
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
 Paul Ely <paul.ely@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Thomas Fourier <fourier.thomas@gmail.com>, 
 Al Viro <viro@zeniv.linux.org.uk>, Luke Wang <ziniu.wang_1@nxp.com>, 
 Kees Cook <kees@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nbd@other.debian.org, 
 dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
 linux-scsi@vger.kernel.org
In-Reply-To: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
References: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
Subject: Re: [PATCH v1] block: switch numa_node to int in blk_mq_hw_ctx and
 init_request
Message-Id: <177981344077.464267.4670805396521914701.b4-ty@b4>
Date: Tue, 26 May 2026 10:37:20 -0600
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 23 May 2026 12:52:35 +0000, Mateusz Nowicki wrote:
> numa_node in blk_mq_hw_ctx and the matching argument of
> blk_mq_ops::init_request can be NUMA_NO_NODE (-1).  Declared as
> unsigned int, NUMA_NO_NODE becomes UINT_MAX and walks off
> nvme_dev::descriptor_pools[] on CONFIG_NUMA=n [1].
> 
> Switch the field and the callback prototype to int and update all
> in-tree init_request implementations.  No functional change:
> cpu_to_node(), kmalloc_node() and blk_alloc_flush_queue() already
> take int.
> 
> [...]

Applied, thanks!

[1/1] block: switch numa_node to int in blk_mq_hw_ctx and init_request
      commit: 65e1c8f96ad1a1f3b72e8a91d1341d570f91d985

Best regards,
-- 
Jens Axboe



