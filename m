Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07081EDA0F
	for <asahi@lists.linux.dev>; Wed, 11 Mar 2026 01:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773191712; cv=none; b=eWlphKprCif5G2TjWIGQNQau4CsfXkLt7aB8+TRNWUsz9dgBY5pM5zRjIgnJLPzuAJpfHbtMPpnD60RX+lSW94aEHHl9ZsnirFf6oNE2xnKmWYAgjk7YwPkLYQhNxro4w5tOzyFx9+D2rtp1bi8w5phd7P6R/ohtgwsLAu50LDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773191712; c=relaxed/simple;
	bh=/oF/doq6oyWwDTCyW1l4hS1E5POtzgyvQYrb/7hmVZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMe28gpVNDKJrYk5f+zoFjLeEXlZBduD6NdOHS/FfvbcWknGgL3yTGnFhOTEXLY7iG1odUeo+rfQ4jcxaA4WffRsrNX3AQS3PjwZ3IUZ06N4n0+XabSFXlT26Ovx0/faAu9v3YntiR6ywlHO7axqI1oF0fgJ6EbV9A2QGRTYqtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b942b36de08so85682666b.1
        for <asahi@lists.linux.dev>; Tue, 10 Mar 2026 18:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773191710; x=1773796510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/oF/doq6oyWwDTCyW1l4hS1E5POtzgyvQYrb/7hmVZg=;
        b=YrIJ33kcMoBMcPHXcZ4NrAgqn6F2Ih3Rwr8d2jf9LLzeyVJ0rhTIbrr9TyjsbcNOL2
         4+3GlRoPzh8yF7JhhjUIbjSvkoXEkqQDdVf+K5R1P/wfjvftt1qJh9nB1iTFYrSFhseW
         Slxk8Py4u1ALV8xY7CdO4GuP98+nXvc2PLDkfyftlmY8+48CPoo9IeQaXb+FtSgtv/n3
         9JMyXL5FosKw+c+vU3CKHqk1TDhyGPUUtMN8TlauIKjpK+2AKLCkXU2+ZCTeliJ+sDle
         Q/v18WXLuRTzFtl7LWPeK1SJ6GpaCo4rfWLNO+gA6zMxSn64KSdUFln45c9B6YqiW66K
         G1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbeT1R1R2/f6y3F3miFNiGFLorPsCM4neBC/sT049bTVF7segvLmvWs180V2XfUxXopH89lQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YybwrB5vYnRB1eEtRasrY37G0JsPJq6xFhO9HOqC62RutokNBX5
	eG0pGd7HTYIa/GH5Id1C2Yu5Bjrh4C9hmz93PamgSlnDKy7NMg5jr2rWhBM1vRsmsFM=
X-Gm-Gg: ATEYQzwG2nEmW2BY0Q5YgkWK9NW1swvppsB9KPEv2f0JVGpcdklRV7qGktYKFj7B/sb
	pmQ4dFu0BHdUrjM4aG8hkDwoSf32aY+cZ67SR4tJ5G5WX2ZqstQUUaEDgOxLV5akHjXi0nXXGg3
	Pd0up+0k9fu+9GRsfLQoDSoFglhwCKi9a/KM0C1/2Tchr5VtSIJLePF0Yt12GK5cL3tPMl+p0+N
	MaBYa/6vERCVOcH0keyn9hA7PXAffxRMZIQT3TAPj1aTsxCuYgAcS6KKPvFesrZwfB751rvkeJE
	jkPvNLOR1Gb9Lql4h0829QC8EIRUkTJM2P3iwrcqqKA4MRPFR2kzsvkf1dPOfVPogUPwPdI27cD
	5PYmeGMnBAKaS6Esmq2DPQeRNN0ymY+7lCiOZkZ/IXU9T0499K3XX4D9lCxDVQzcf7tfFUwaKIJ
	AX/74POHHBY5JvuircMjynAbEjJgwSQdg8duBPLdRx37yvojOEoGBB54jRhu+NN7nfRA==
X-Received: by 2002:a17:907:d0a:b0:b8a:e013:9c5b with SMTP id a640c23a62f3a-b972d3d0198mr37982366b.4.1773191709709;
        Tue, 10 Mar 2026 18:15:09 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97307dde54sm7405166b.11.2026.03.10.18.15.08
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 18:15:09 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b6d9c981so297386f8f.1
        for <asahi@lists.linux.dev>; Tue, 10 Mar 2026 18:15:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzpj2dyvsXxb2b0qgsP4UukypathcLtIduJIyxiRwDAV5+pc7AGD9i3fLPKKISSE4oFthvow==@lists.linux.dev
X-Received: by 2002:a5d:5d05:0:b0:439:bb46:7457 with SMTP id
 ffacd0b85a97d-439eff518c7mr10359487f8f.16.1773191708627; Tue, 10 Mar 2026
 18:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
 <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com> <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
In-Reply-To: <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Tue, 10 Mar 2026 21:14:52 -0400
X-Gmail-Original-Message-ID: <CAJNyHpLU7sTJRtDqTbczTz0iayj-Nm8bPHrPaOcsKVb6nQyw1A@mail.gmail.com>
X-Gm-Features: AaiRm51cz7xo1V1erpi09gKFdY9TTILawmEFCzQE55oadwxdss7qBUImRUPZq3I
Message-ID: <CAJNyHpLU7sTJRtDqTbczTz0iayj-Nm8bPHrPaOcsKVb6nQyw1A@mail.gmail.com>
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

On Tue, Mar 10, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Mon, Mar 9, 2026 at 4:55=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> wro=
te:
> >
> > On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
> > <csander@purestorage.com> wrote:
> > >
> > > On Sun, Mar 8, 2026 at 11:30=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim=
> wrote:
> > > >
> > > > The numa_node can be < 0 since NUMA_NO_NODE =3D -1. However,
> > > > struct blk_mq_hw_ctx{} defines numa_node as unsigned int. As a resu=
lt,
> > > > numa_node is set to UINT_MAX for NUMA_NO_NODE in blk_mq_alloc_hctx(=
).
> > >
> > > The node argument to blk_mq_alloc_hctx() comes from
> > > blk_mq_alloc_and_init_hctx(), which is called by
> > > blk_mq_alloc_and_init_hctx() with int node =3D blk_mq_get_hctx_node(s=
et,
> > > i). node =3D NUMA_NO_NODE would suggest that blk_mq_hw_queue_to_node(=
)
> > > doesn't find any CPU affinitized to the queue. Is that even possible?
> >
> > Thanks for your review, Celeb.
>
> While I'm flattered you consider me a celebrity, my name is Caleb :)

My apologies, Caleb. I'll be more careful.

>
> >
> > blk_mq_hw_queue_to_node() can return NUMA_NO_NODE if the device queues
> > exceed the
> > number of CPUs. Afterward, it is adjusted on the caller side to
> > numa_node =3D set->numa_node.
>
> I thought the NVMe driver capped the number of queues so every queue
> is affinitized to some CPU (see nvme_max_io_queues()). What am I
> missing?
>
> Best,
> Caleb

You are right, every hw queue should be affinitized. It seems I'm
missing a lot. I'll look into the reasons and get back with V2.

I appreciate your review again.

Sungwoo.
