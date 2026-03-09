Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA53939BE
	for <asahi@lists.linux.dev>; Mon,  9 Mar 2026 23:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100739; cv=none; b=COQ1v1IvskAXyRGuM0aBh0bjYgPiv+68qauS2t1FAFWN1SpmH23IPZZRx8+mQK/0/leVa+hZ1RoUAvITlt+P/R04iROJ8v+YFalELb9S4cQbAwMnddTsAbT7G8tUNyGa9FM3FsiJS3ehxZXp3dqCO7KsDDsiv6KGCQOSagYdcFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100739; c=relaxed/simple;
	bh=40Mlp2c6INEworHVA8B/tjgxxnGjEAtQ2cBtMbRWvDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1DwTv16QzJt9mvM+qKFBQViX9ftXNxlVK/vD2TDECy7Dg20pmcKlWmqM2xPj0jltze8jS/coc0umrWYTULpN40xUY4JbszZp03V+nRxmBM2sDYTvrjqgeDAdDZ1SUFjriB40Rt4BY0P1ju9KtiK0nUacZOTnLlZAin7AzKedUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b96f02b4329so285249066b.2
        for <asahi@lists.linux.dev>; Mon, 09 Mar 2026 16:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100737; x=1773705537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oe74yVewJW4EdL4NdMuEiANgmdgDMqRgsPaxoV9IVrk=;
        b=PiDYtWChufpvtSzx3fCDQhQujinB4JAID8qkW0pcbkoSLgt5cTTlZY/7QLxRPModIX
         Wkxg2mkCloi3U6Me6nNRPC2N8wzxSljuK6sLTY5ler6zVWeLqC0kt9wycjr3faSGI4dg
         3jF9q9kkuZqlTOd0C+CXOj6iTO1wr3K2kAb58q3bf1iPOdrLvZpu/YDPaEJYLQvm0tK6
         pEfBv9NExgiIeZn00e+MbtZVPnTBN1+odICGfKxcRoZcrf+T86dla06r7rLSWE6W7wmG
         OgkAKYoGsOq1HV3AWerjP+oH4GIUjWuAY1EtBeGzMiWeQX6ZgoaKa7cWqMBV24Ak5jBo
         SOoA==
X-Forwarded-Encrypted: i=1; AJvYcCWIb+NoyUEzf7eYgFfr9qjqg/JoYpfaVyT3yKsjndVrZTxHImFrl/TAfoHrD1m8EBNk06G1ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBYKZN5RjgAmhnRrTjj67D28cG4wcRG5fwaVck9YA4aty7O4ca
	E85o5WXeZr98N7tTaBBz6ZThkJ3HOSH3WpGg7lGrYhbwSW9WkMsuelIpHhJ3nBBujik=
X-Gm-Gg: ATEYQzys+AVYupXMDZvqk00d1QWkPpOh4BNlFI09txk1WVKRMenWukpMbhEkTW7f/ZF
	vrzsw04EDCk+6nB9P0K2lbYOmwsTgbwUhlieH5AREbTLD5mhgP4EPGiIyGPCOGuloH5/mOwLWKr
	G6VQFdPeMC2JLHY5fMgFbcgYFOsdYGi8SeC8fNPq5TZmRz281BC+wh94a9rhir6r4pS1foE4MTT
	qa6EZ/MJ2z4neGWZcBQvncKvgvMx+GLeci2Hg188t3DvoJgbvnuuZ1AHNdHvEL4FfL2XfNxpxtA
	dHDKa5iqf7WB4I61sow2izkTOt3vpq7bpQlseRgszo1+cl6YCwuXfad5hPCBsIKeEa1gAsjOYP6
	Zboe7wLurokIv9Pq7tQuMS30JAOjGKbomCbYPJsu0VQ6LKdZr/+Z1McUGDT2Ljwjc5cCO4YGm5H
	m2+KTRH2xNFF2aUTT+GWERh3+j+lcSef0aK1+TJHuPorzH2RGAjKRLQys=
X-Received: by 2002:a17:907:7fa4:b0:b96:eb7e:bc3b with SMTP id a640c23a62f3a-b96eb7ec9a3mr339141366b.49.1773100736597;
        Mon, 09 Mar 2026 16:58:56 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef42a85sm441584166b.6.2026.03.09.16.58.50
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 16:58:52 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439bcec8613so6462393f8f.3
        for <asahi@lists.linux.dev>; Mon, 09 Mar 2026 16:58:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVh4eL6I4sOUDy2dFtlBwH8wiIto4SoUHOaHzeuLUxq5bxfj6b/o8/Svo1Mrf08ZMt1PySqnQ==@lists.linux.dev
X-Received: by 2002:adf:f4cb:0:b0:439:df33:827f with SMTP id
 ffacd0b85a97d-439df33828emr14050045f8f.10.1773100730271; Mon, 09 Mar 2026
 16:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <202603090911.0DdOwjTR-lkp@intel.com>
 <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
In-Reply-To: <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Mon, 9 Mar 2026 19:58:34 -0400
X-Gmail-Original-Message-ID: <CAJNyHp+a8FqB7Y8DobMxKOn9KAQXH0KvHTRgTjFuMppneSznvw@mail.gmail.com>
X-Gm-Features: AaiRm50FODLuR7mIvmUavdQJgpvkliqN2c7Myo_nPa5e2Uo34ON5h-NAjYa6-ys
Message-ID: <CAJNyHp+a8FqB7Y8DobMxKOn9KAQXH0KvHTRgTjFuMppneSznvw@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: kernel test robot <lkp@intel.com>, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, oe-kbuild-all@lists.linux.dev, 
	Chao Shi <cshi008@fiu.edu>, Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Mon, Mar 9, 2026 at 1:42=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> >
> > Hi Sungwoo,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on axboe/for-next]
> > [also build test ERROR on device-mapper-dm/for-next linus/master v6.16-=
rc1 next-20260306]
> > [cannot apply to linux-nvme/for-next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Sungwoo-Kim/blk-=
mq-nvme-Fix-general-protection-fault-in-nvme_setup_descriptor_pools/2026030=
9-143107
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git=
 for-next
> > patch link:    https://lore.kernel.org/r/20260309062840.2937858-2-iam%4=
0sung-woo.kim
> > patch subject: [PATCH] blk-mq: nvme: Fix general protection fault in nv=
me_setup_descriptor_pools()
> > config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/2=
0260309/202603090911.0DdOwjTR-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260309/202603090911.0DdOwjTR-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603090911.0DdOwjTR-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> error[E0308]: mismatched types
> >    --> rust/kernel/block/mq/operations.rs:274:28
> >    |
> >    274 |         init_request: Some(Self::init_request_callback),
> >    |                       ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn=
 pointer, found fn item
> >    |                       |
> >    |                       arguments to this enum variant are incorrect
> >    |
> >    =3D note: expected fn pointer `unsafe extern "C" fn(_, _, _, i32) ->=
 _`
> >    found fn item `unsafe extern "C" fn(_, _, _, u32) -> _ {block::mq::o=
perations::OperationsVTable::<T>::init_request_callback}`
> >    help: the type constructed contains `unsafe extern "C" fn(*mut bindi=
ngs::blk_mq_tag_set, *mut bindings::request, u32, u32) -> i32 {block::mq::o=
perations::OperationsVTable::<T>::init_request_callback}` due to the type o=
f the argument passed
>
> Looks like the type of _numa_node in the signature of
> init_request_callback() needs to be updated accordingly from c_uint to
> c_int.
>
> Best,
> Caleb

I will change it in V2, thanks.
Also, I may need to split the patches by driver as the cc list explodes.

Sungwoo
