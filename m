Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CC33A9D94
	for <asahi@lists.linux.dev>; Tue, 10 Mar 2026 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158222; cv=pass; b=jr6d/T2ST7GovKG+mwo2naDpN6DqfbuG5J/nYfsYkfY+htKEEJuK96jtzFepV2iJYY5l1bYvJtYqNFGtunW29nCfYsbhoV1hTaL3tSFz3MFKBhUtBNzzY3Cb5TqXdm0FUJ54MVVlpoBnXUOVY4iOOb/CQMz9v7LAh7pYhy4I7R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158222; c=relaxed/simple;
	bh=aZ3QAAiJWKfJPFdOqgfaghwjaxM2wYZxCugoj3b5jMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPkAb/94uLgk4gbGKSDaRZ+Rd+OMDdLEg4DaNPuurwEj1ZPeBJdMNvVb89TrYqHBKVxstHW8HFi/lABZvMpDWtsE8r583CUD2/8lkIAI1uawYSdZxmvkNUM3BKCc+RnvPR5695got8dJ9/1tXiMqful+cEUUaU89Y5bioScHhHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Gzd2dwmQ; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Gzd2dwmQ"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4170dc73280so308861fac.0
        for <asahi@lists.linux.dev>; Tue, 10 Mar 2026 08:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773158220; cv=none;
        d=google.com; s=arc-20240605;
        b=DjYtr5zCcVXF7aFj5oFvVjZRW3ZITVbE1MYwmXbhm5AHUoVmgf8hq2/n+Au53PNfPe
         9A1tl/WDOTzRJtRY+woGiBCVPYBlsmhX5Ayyb9Yt3c0krsWlZtPT4f7xCfqTedUF7cLs
         YyKDxP2x6+nyEO3IQELTlhIE2bt2PRnExC/mYOOLaO0n8nxB+0kUsdOilHALaPWI9EET
         IQppm4jfkmWGjRlwRZ6fWI6LmCQ5dufZffTgoSrGZchlVFjzxRMbbe+l9/flVm0/ACXe
         KTSDSjR8rcPDZHsusOsVG8hZ89he994lw3/bvBJeQF05Vzx9EvK0mEn+dNrn1lOu8Mzs
         Yj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        fh=bCEGqA/8nPV9I2ODdNZKhNF3v8400k2uk84FG3q/dNQ=;
        b=BUdIFnPEkjqWLvshx9Nrs9kapt9I152srQiiBnBAG5SRtKphKDBlPobQxdSgYhE0qg
         f6cyV8etKABNYrPOtRov7bCWo9HlVA+cG5sW9loiuMNuoPukNeoEwBZ9vQHwy5PxwQGf
         jx6UB2SQ1G4IAPXmC9VMzTKgxe/5ZCj4ooDpwl+I/bJXtOyHm1RIXvdmN5mBKav3czBB
         5sXGH22smQcOSliUUWeYPHn6arq01FJdzMSXDJoFF+pTDmHPGMaaVzNtA1Hcdwg9Pm3J
         j2rNqeeMTkMaNxgeM2VpbefDtHPN4ufa+mYO97ai9rlIK6ku3kccMO0HooaIhbn/pjRi
         HFQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1773158220; x=1773763020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        b=Gzd2dwmQLiPFszNphY9ZzbUPyyRUUdG7N9o4ZcA9ef4hbGaHL8v15SWIviDvUxCW/3
         DH/ePZtnYvqq8QJHWbJvbA2Ht6c2InI+Flt8UKAh3jFvWjZHFuPz8MQXIvdN64d1+HGb
         uPRkjadLbDwVioP9irMQjxBYDlJTbvwoCLGNBUQ6gANwJln0g9IJu4PYM9ZJ/Tl7vnFR
         onf3URMO58CglJ7O+wWN6kQ3PXjXkcnTS5U+xrs5okqayHy+b2g5aVxrv2GkE12aumLQ
         d2LviAC0OaDoa6XaGL17uAYoGmCLJPwQ4bGLO986EqyEMoGPQTd8XfHs8r2nZwDZDWjg
         l/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158220; x=1773763020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        b=QT5HARSWSHUlBCrAVYjFfr7khLCa5oqaAJqb6W1Ev55IGCaneasdZIT7Fxo4IrFx5E
         lotly7q/q31RtStJSWvzU5FmYQkQnSq4MITLGnJuWrXUKZ6UxA8YqGqsM0HaoTzBChtr
         l5JQhp610/tkrFKqwtBXLtceiCB/iRknSz9ue8yMu+2sC5nL76UeeHQ9egUrrrivFonj
         3RzAnLGk93rPGnHBiIxS8THHB7+B4Yiwi0L50GcvC/W504uMhKROKfMUUUrcknDAEzgE
         qf5u3O6CO1a4rSQeKIxUc3QyZ9tL2Zw5CshKpYtgRKC0aL+bJAsBpSLiFEscdBxTC1R7
         fmVA==
X-Forwarded-Encrypted: i=1; AJvYcCULx1oqxSWI0onUvgBch6bWLJviAIym43ylgD2fTih6YUBHtklEcUkvLGNOnsySxnwKtLOHGg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8IsDPiZ7LO1H8Bn1VvYlfdX1B/tyNXE8rQlzDlM3f1EQIoFbG
	c0p3V3yHTC+kBeYbviFO0OudrsXd5XFBFfecWlbqR9Nz4sAeyJuFCFBwcu+9oU/E2QdbIkmqqQI
	5J73grzTRKPlD97+iQ9+TDN+roOtk73aWPb1QcBR46A==
X-Gm-Gg: ATEYQzzKsHXvQyZORtMkKzsZVbjbLri7v3CPDROIyhrzybk3pWfIyjIgVhvDxWxFGzJ
	TNW5qPfe9e51urZwlo9AeWLr3E5pMwWmOSarek1nD+XBvaVdj8vwndojAtzE+/tjVfcav/mV9k9
	yGMNMZlN05GqEA3dspf/r2ubic3MrllGCkdFPW1Q9OyaLMAzYRVadY3rNkhx2Ejxi9Stne2/Az3
	ttglsQ72W+3UkUv70gFsvTXm6N3AU2B+eZ2J8sIq6gp32H4yJVMMFoZVoFf6cBkzMPmJ41pn2pf
	y+RzN/p8
X-Received: by 2002:a05:6870:854b:b0:416:3f50:ea2 with SMTP id
 586e51a60fabf-416e45c1dc6mr7199342fac.8.1773158220092; Tue, 10 Mar 2026
 08:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
 <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
In-Reply-To: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 10 Mar 2026 08:56:48 -0700
X-Gm-Features: AaiRm52sHfM1lLReXhJ6K_-eQeuNMsoWbyv4AHit6rY5_ursGYcV9eDpU-ihUic
Message-ID: <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chao Shi <cshi008@fiu.edu>, 
	Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 4:55=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> wrote=
:
>
> On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > On Sun, Mar 8, 2026 at 11:30=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> =
wrote:
> > >
> > > The numa_node can be < 0 since NUMA_NO_NODE =3D -1. However,
> > > struct blk_mq_hw_ctx{} defines numa_node as unsigned int. As a result=
,
> > > numa_node is set to UINT_MAX for NUMA_NO_NODE in blk_mq_alloc_hctx().
> >
> > The node argument to blk_mq_alloc_hctx() comes from
> > blk_mq_alloc_and_init_hctx(), which is called by
> > blk_mq_alloc_and_init_hctx() with int node =3D blk_mq_get_hctx_node(set=
,
> > i). node =3D NUMA_NO_NODE would suggest that blk_mq_hw_queue_to_node()
> > doesn't find any CPU affinitized to the queue. Is that even possible?
>
> Thanks for your review, Celeb.

While I'm flattered you consider me a celebrity, my name is Caleb :)

>
> blk_mq_hw_queue_to_node() can return NUMA_NO_NODE if the device queues
> exceed the
> number of CPUs. Afterward, it is adjusted on the caller side to
> numa_node =3D set->numa_node.

I thought the NVMe driver capped the number of queues so every queue
is affinitized to some CPU (see nvme_max_io_queues()). What am I
missing?

Best,
Caleb

>
> set->numa_node can still be NUMA_NO_NODE if CONFIG_NUMA=3Dn (trivial) or
> pcibus_to_node() returns NUMA_NO_NODE if ACPI doesn't provide
> proximity information.
> But I'm not sure if this is usual in the real machines. We found the
> crash in QEMU.
>
> > >  static struct nvme_descriptor_pools *
> > > -nvme_setup_descriptor_pools(struct nvme_dev *dev, unsigned numa_node=
)
> > > +nvme_setup_descriptor_pools(struct nvme_dev *dev, int numa_node)
> > >  {
> > > -       struct nvme_descriptor_pools *pools =3D &dev->descriptor_pool=
s[numa_node];
> > > +       struct nvme_descriptor_pools *pools;
> > >         size_t small_align =3D NVME_SMALL_POOL_SIZE;
> > >
> > > +       if (numa_node =3D=3D NUMA_NO_NODE)
> > > +               pools =3D &dev->descriptor_pools[numa_node_id()];
> > > +       else
> > > +               pools =3D &dev->descriptor_pools[numa_node];
> >
> > Simpler: if (numa_node =3D=3D NUMA_NO_NODE) numa_node =3D numa_node_id(=
);
> >
>
> Thanks, I will modify it in V2.
>
> Sungwoo.
