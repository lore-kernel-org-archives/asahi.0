Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF523958D
	for <asahi@lists.linux.dev>; Tue, 10 Mar 2026 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100818; cv=none; b=A9fB/nscs6T7ckoANuTmv9tJPC4T2BTImQCqnNMacrc4xe2TnpYg1nRw3NOvT2KXnWM3oSKSDfnj5DYYxAXOgrzdvys/5SX0CUCgR82XoL0pCk89QtH3lA2Os2/LMLAeD8GWBI1a1Exq2fDcPK7T21tiDcY4mdqZqYerwIKsfx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100818; c=relaxed/simple;
	bh=6Vofe/6ZWdzfe1bQhwcok7tc5hua1lVSK0g1U2J3b8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1veioJi+vDLB86SJUBOlNV/WdfIXL2odkjjbrC3IOFLrXAmfM8O5+w8xSONYcFF40p/F9GiCX9cOhy208kwUmo92705F81raRqJYCUr/KAS/pgF3zh9M97CWv5cedMRBRgZ22PsAtfrIOURNGzr3NRH6GpePOOgi0smg7etdzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b940f962a82so765835166b.2
        for <asahi@lists.linux.dev>; Mon, 09 Mar 2026 17:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100815; x=1773705615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wUJ62UzriDRExITrg9iBzNvEWYzDINBTrPfASD/nLws=;
        b=CHWSv26EYRyOqizIUVbTO2gOE1I2qQ1mLoM4yJl97ICvp59scWAMWwQqAv6VMc3E0Q
         cBo1YNAtCoBaLA/xXEH8QaA/9O9LVz2vwasgu9nCaBoUvTJDlENZUJ9ptoDgd+cVa42o
         Ukr2fvE0ZeSh7dyelK2sm0649lb/1PLkcgp/c0+9sS3iPEtIWGJFtLFkx1GRI/TRvtag
         VxCY4B8Mf+qUyx8t71jzciw72bWk5OlsSAnh9n+ePB1o3zYkrVQ9rDiQYIX7h56sq31j
         8I9DHxcWA2ZCoakV51ayAItiS7mHUbmM3DC1LMcbO7IZg5fcUUr42IRike5D9KtW3oYY
         fhSw==
X-Forwarded-Encrypted: i=1; AJvYcCWH/fvlkYnHAbRueiob9+zJjuK+sLZLni+mmQlO2x7mfoJXFUTzX9jEYwGnh4/ELi/OJUmqJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSTUlzDGlanBm7ONNigjnaSbsWT7ygjVoG+paWJyjHIeulzlaU
	QIjqk8jhGPi8pEJiZBDvUhyUmWW+0HO2Ic8r4Nt7/QXZKXLEKAVJyCUxjJZ40YuAwWZ92fH0
X-Gm-Gg: ATEYQzw3cweObHUvpAVjozEgKX3m2fMgU0HNhhAus87bzyv72XfIEc/yY9d2UnAeGTS
	Is8BXU7Dk+w/1NRrKHRl0jYGPQ3rdV4dMCGXfQzJrP2DO6Q3jV4rM9LROoEjcKQ4y+rFM+ukoP4
	NuAe3BAYT784GxI9Yx80Fc4dZMX9V/oCZ1bQp0MGKYvNNV0A65iuyQ7KVtcepB8d6QpMHFmDNM9
	gduDcOb2DGH1IUaaiBx+UMk4TC9qKMBcfPYQ7fSSHXN/IELmzD23DKOXMmn5SPRqnuYHTeh8Z2l
	hLe1pAfb4htd04ou2/rKmo9vcXgcEGNTiPb4AilKyiY8OuEnJm2tHae1jP/nKuNVCQAM43FFDfn
	l2KJQGPmaUS3YwKRREpvTH/LplhYg1d1pIlyNp3uIYjUu2C05ma8vF9M0vyvOBbbkNzhPZGfLbM
	IYzHdWUCkytBydHPiQxCY+L/9hyy4u9KkD94OZ7H2jSzc/YpG0KxpSM2Y=
X-Received: by 2002:a17:906:2081:b0:b96:f863:dea1 with SMTP id a640c23a62f3a-b96f863f234mr162181966b.3.1773100814688;
        Mon, 09 Mar 2026 17:00:14 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15c199sm438985866b.47.2026.03.09.17.00.14
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:00:14 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b940f962a82so765832666b.2
        for <asahi@lists.linux.dev>; Mon, 09 Mar 2026 17:00:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOIUUgYr3Afl9/ze/mwvx94BJt++OQ/YAkxFFYxoyBxK8JyIQib80pcTAu+8grgJFGMItkeQ==@lists.linux.dev
X-Received: by 2002:a05:6000:144b:b0:439:ac33:5082 with SMTP id
 ffacd0b85a97d-439da66b72cmr23928350f8f.26.1773100503051; Mon, 09 Mar 2026
 16:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
In-Reply-To: <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Mon, 9 Mar 2026 19:54:47 -0400
X-Gmail-Original-Message-ID: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
X-Gm-Features: AaiRm53vE5uEinTHUYE1aa6bIvdkwyOpz0dn9fOlsjLR4PN8Z_3w05vllGJ47mw
Message-ID: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Caleb Sander Mateos <csander@purestorage.com>
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

On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Sun, Mar 8, 2026 at 11:30=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> wr=
ote:
> >
> > The numa_node can be < 0 since NUMA_NO_NODE =3D -1. However,
> > struct blk_mq_hw_ctx{} defines numa_node as unsigned int. As a result,
> > numa_node is set to UINT_MAX for NUMA_NO_NODE in blk_mq_alloc_hctx().
>
> The node argument to blk_mq_alloc_hctx() comes from
> blk_mq_alloc_and_init_hctx(), which is called by
> blk_mq_alloc_and_init_hctx() with int node =3D blk_mq_get_hctx_node(set,
> i). node =3D NUMA_NO_NODE would suggest that blk_mq_hw_queue_to_node()
> doesn't find any CPU affinitized to the queue. Is that even possible?

Thanks for your review, Celeb.

blk_mq_hw_queue_to_node() can return NUMA_NO_NODE if the device queues
exceed the
number of CPUs. Afterward, it is adjusted on the caller side to
numa_node =3D set->numa_node.

set->numa_node can still be NUMA_NO_NODE if CONFIG_NUMA=3Dn (trivial) or
pcibus_to_node() returns NUMA_NO_NODE if ACPI doesn't provide
proximity information.
But I'm not sure if this is usual in the real machines. We found the
crash in QEMU.

> >  static struct nvme_descriptor_pools *
> > -nvme_setup_descriptor_pools(struct nvme_dev *dev, unsigned numa_node)
> > +nvme_setup_descriptor_pools(struct nvme_dev *dev, int numa_node)
> >  {
> > -       struct nvme_descriptor_pools *pools =3D &dev->descriptor_pools[=
numa_node];
> > +       struct nvme_descriptor_pools *pools;
> >         size_t small_align =3D NVME_SMALL_POOL_SIZE;
> >
> > +       if (numa_node =3D=3D NUMA_NO_NODE)
> > +               pools =3D &dev->descriptor_pools[numa_node_id()];
> > +       else
> > +               pools =3D &dev->descriptor_pools[numa_node];
>
> Simpler: if (numa_node =3D=3D NUMA_NO_NODE) numa_node =3D numa_node_id();
>

Thanks, I will modify it in V2.

Sungwoo.
