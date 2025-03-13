Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7598267721
	for <asahi@lists.linux.dev>; Thu, 13 Mar 2025 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741872282; cv=none; b=iJshPkBl7CJelsvXnQUAJg70bUkSvdJsqXghYEexW4nr+kiUSu59vwqceFJ491TLZBn6/hKlqsOoiXLJ0gDLcYrMiISTgHvGgNqLyT14MBOhK4/7x86/z8tjU5BMtRW8I4WJSfzlC/fUvN9GEFjmz+Qf673UOoEtN4y9DwvqP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741872282; c=relaxed/simple;
	bh=oxBvzwvTrG82n8EJbBWNJ307/ROiMAIN3ZDd1Xbf3ig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YzWRZj1PSca/MSQUN9uM86aw4iPSSoQUTOKeWfjJEPTIKs7E0GykfTQgcGYxNOqmKtuWyhMsTe4+7vN0aNMCQ2LIucem+T25wrQFQ/bmmQr0q+oKin7NT68qDY+IBZDXZsZ78WXcUlZBzU1t9Y+5bG3NCPr+jyOds+BxMIyGuPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=d7RATxid; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="d7RATxid"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-851c4ee2a37so68765639f.3
        for <asahi@lists.linux.dev>; Thu, 13 Mar 2025 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1741872280; x=1742477080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=;
        b=d7RATxidUy7dmETJXcO4x4ewKtm3ls6orX2JQvp2jabBaKNpVYp7ctZGDf3r2u7jqh
         SNlhnznSmfGs4CMTbXi52F+/DgkKOQZ4bhBQBiP12BvRhvVAiLNM0p8mPbzPfyGRbD4v
         aLEsJb5hNpmZy9u5De+BPyhrFzBuMyyYllnReY7dtpwPkmnp/ELPNR2GbHbRA9tWX2j7
         MsaFz2BVHPvy61bodzWfzZDm6MfQBpDG+cFstVFHYhA3JMDa0N12x1n5lFpLwn25HjOn
         QSpzDeSiDSV2Wq+24qjeV5RtNbi/mqOXdpASwxn40KJkUQCcFx7JVcBG6M5Y/DJl4Bin
         GfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741872280; x=1742477080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=;
        b=k1ssXF/0N56wy4tDRswnvX4A2sh8jhGmKJ1VbgtfOzDkyaFHkIkLIA+KVZZhcZ1qrA
         c5VojKZNgqycZ8zKS9Ss4RaVvWypikpHIDfu17LuGdHkt534Ur9Rm7iirm0g1qEA2QBP
         q2ERlKCYTEmjGN8Q8mYJUoFoRKt/b+k4/qkcDqrj+gJMlg6lqlW/iCb2rh7fpBAy7ubX
         Iz3H3rUFyrLm2l0hqV4ZP2ENYhnUnHRhCaiIDeSEAchvEzqA08GxVxTzTdb3BdOo3V07
         pJWODrpFCS2o4mk0bAqHZq3UubggQHPGk5reuEAYbYE2f5KSGi3yC/bnf37EZiiO/nrk
         Vcmw==
X-Forwarded-Encrypted: i=1; AJvYcCWF/KxLlTZOXn0r/eK62Fs8zmmoKo6Trd7bmbj6mUblIdxMIzxFRTVKnoaricXe+VPs2Yu/rw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAZjWU6pSh5qQDuczGVnJtmqI+qyg9CU0QR8s0X+jSMRdgqGaF
	tF8f9hGrHi6BHRhbPtfBwUS5pVSx7Kq/I6TPXKwJlzfpld7Uid1gLDiiPz9SMSg=
X-Gm-Gg: ASbGncuth8RfUeIGIVC+d+l4CqJWJpBkgxt1suAUmbuOiA+L5HQFUUcbZhtR6dWHpaf
	8m4FtRmCyKVbEWH9KYepbbVr/kFFoJcOG7cmQv+EbzEmDPpsS1HP53csLJ6pquQzZW9L7H+Ha7b
	lPqlztE9yHS3sFSw8QUhAqSwPAS/aD2w7GOjwa592fcjhmVvhBTXsoVOsVbkRW0i72D/1NldRr5
	e0Jcwle+Wx3eiYc4kWNPZPYrcBoA6T+Dv4CZYtWc09sUKsrY7ooTR+gK7eiUlInosIO9y7Aqu1B
	hE6/SvmU1veAkwlC681a0RrRk2rI2UmAMMY=
X-Google-Smtp-Source: AGHT+IEer637uehs/daevOydns9iUer0NF8/Lop3Ui7LDoPjH6cMpb131IF3qkXQqxQNFL57dNEHAg==
X-Received: by 2002:a05:6602:380d:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-85b54946d71mr1891701439f.5.1741872279762;
        Thu, 13 Mar 2025 06:24:39 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85db879e512sm31580739f.28.2025.03.13.06.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:24:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
 Chaitanya Kulkarni <kch@nvidia.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Anuj Gupta <anuj20.g@samsung.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
In-Reply-To: <20250313035322.243239-1-anuj20.g@samsung.com>
References: <CGME20250313040150epcas5p347f94dac34fd2946dea51049559ee1de@epcas5p3.samsung.com>
 <20250313035322.243239-1-anuj20.g@samsung.com>
Subject: Re: [PATCH] block: remove unused parameter
Message-Id: <174187227786.18244.14269218969550436496.b4-ty@kernel.dk>
Date: Thu, 13 Mar 2025 07:24:37 -0600
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Thu, 13 Mar 2025 09:23:18 +0530, Anuj Gupta wrote:
> request_queue param is not used by blk_rq_map_sg and __blk_rq_map_sg.
> remove it.
> 
> 

Applied, thanks!

[1/1] block: remove unused parameter
      commit: 61667cb6644f6fb01eb8baa928e381c016b5ed7b

Best regards,
-- 
Jens Axboe



