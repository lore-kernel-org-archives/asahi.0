Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364C3C197D
	for <asahi@lists.linux.dev>; Mon,  9 Mar 2026 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070312; cv=pass; b=RWwswK9G0Lk7TXfguDSDhGE7bjVPhx+Y8uR3yFGYQo+vT5/4pKwccguOcBg0NtAMYqUd7ofgrFnfax6EI7gSnVVGmDfdlEaaTkrgADsDrcqQ3n3+j2Xti6YTBgPXODeoE2MrE51L/IDdLZT2DAUvIdCaOA03D+UoZ7eTicFWJIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070312; c=relaxed/simple;
	bh=X4iZhElZiqQhLsc+HE815O54rp2BjBnsxJg+ObtrQac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKnbQKwy23ln+OaZhqrOm9i9yMwFmPy2ir85h+Nd013YHsIs9hONR4zUhMosiN7u1s8rldUHPc7kjH3zhsMO0wHqVgdjKn5vA+m4RVBTb+CLUiQUlfDI687CIHd4VGQ2g4vP3Ww7zVZmF2O7N6jm+qSg9BHK6v7cpMSo2TJG2Ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ZbWjuWt/; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ZbWjuWt/"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d74fc3afbcso25409a34.1
        for <asahi@lists.linux.dev>; Mon, 09 Mar 2026 08:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070310; cv=none;
        d=google.com; s=arc-20240605;
        b=HXhrx74VeFeAykheFNNh4YndhKA9kla1LLymq62J3lzM2dvrHmBk0Y9fQn4PBxhXJc
         QUDh0D7kechK6PkAn6xSHrrz/25dghfGIDNLV9uiXQXZEkOA7mv4XBjQVzx/KQGK+yGk
         GXe8sXHnTk/A32Z/D1gqbPDiK648pfsPoJyYstbCh7ugoZbrCIxgr9gy5iQQqbCgW+uc
         20rOcsmi7WppQ7lSHyh6xkshZYW3AJqfcUZUtEskkwpxImcMOeni0GHjIIRYhzcduwAY
         nV/483ZdMpcOz4ZteFFQCV8cZKe6X2z4nW2yZS8UlCLzwD7Kq5BsSzXLMSGAzOIynhtz
         8m4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        fh=rQ95CW0+ZUAM0X8nkxStncBZYMsBw900mlzUNStT5VY=;
        b=E2dobHni0dXtJiqoHMprmI7wZDM2Ilm5Q+MywV76bCxtZGr+eVlkTM/fOsjRnT60os
         yOntNcCEq+dSs4msPGkBJk8RNv2zI0NgVRj7xZiU9BN/QqBTFd4ZfuAwpvo6mPfkaW+B
         1KJgw2WQcJ5eXULdVKfVEFcMaXfvEQfoypkaeu4pK/qWI3vMDvRSB5FwAD2ejjzz7l5N
         hCKePg7ssw81vBd5Qp0fF88Zm7xZ3aZ5j70wbx5SHTSw33zUOQwflQuQvEnSgDoOHO3r
         Z3tiTMv2p6i1rtVa6vTyx2FtViSeWHRGsNZa1sSOX6SsW0+9k9rEtck0H2XjBuZ4WxYE
         uPDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1773070310; x=1773675110; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        b=ZbWjuWt/++0VphMGLHuITKGiCITdNb8g3UlD8QR/vVZz5/wLHxBeyX8UjitQGCLFwO
         pxaNz+DdjvbqwEZ/hyAr33JVi057/eU9LZAnVxfuBBEU2NxQG9v8AWVNkTwC3flKKiot
         eDhbYVmM8uG4XlJN/kKBa3INZF/l/fL4HdvsIgzXm2Mkz55bRlRTlPIDo0fsx5L25Dgn
         0g3Zt6pRC6XceUSWOPptk6steioC4lhLa/zklUlv/Y8NHsXZ9VQ4srGHfh9ChV56K59+
         8e+Et5+btX6Kjr6h16rAl3rl6FvVLLNJzRZ0RAs6FD+gsglrGFcOdGJXgMAK8oeWdQe8
         ZSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070310; x=1773675110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        b=GoDWjN8QRwJBCW7nmkoLqiZ4w2E/HxoTiHOyiMRImaDHL1sq0VWkPPatnLAxnp4Mlr
         znPhPGVor0QCHW97SjEz5Td5On1TayM3L6hVrTx/AeJDmHykd22uHHcCTZ1RxaxRXuyN
         qBuAzGpAkirNEFOnfpZPBn+ma3GZ/B/h26sgnWCupQjyJjJFp8gTeIaC84osbI9wi+8P
         dWmBQch+3tpcoZXmtZSkAELd+xPjSSmwZ4vX7FLHe6TY7vmjImbWWj7iTG6NKMgA9UTU
         TThxBPtmoq/NQI52fOyoW8/Z67DpGk0Qefcq+kh6K3OjrV1RFIDrqivXLzYGb2ojZYeI
         dG8w==
X-Forwarded-Encrypted: i=1; AJvYcCXUeg53BbgKJsOEyOvDudpiauS0yO9T8BsldoCHAqaMeF5ti02xxuRqWjAVyYApD6oWgz1IHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwinnmSveVQbV21ZP4rPsY/wgerUvUMKJmwGk4+69BZ+oI8PO6J
	oh7VC5T3w4GBFIR8dsjGeLSWV0ZCqrOkwdTupDYFB3OQWYH4/1bmXsxuxBjbDwcNNeR1q+m6DCb
	4HHNNwVJpPf2IvYVOR2K43AaGa3lZVpnBL8S9XoWmaQ==
X-Gm-Gg: ATEYQzy/zoqV7Ogi7EhUbSFumiCsfuSpKQs6FNv2gaNzmuP0Cayn/dk8lfBPrQCfhap
	Ou2zu0uttQb715v0XxT7chCaX5LxpkgAYnZjE5g/lx7KmsblCGMn8A8IkcxsmipDM5xux9QE/qX
	jUZDlhSihjnnTqSsD0CwwCODPiNUUWu43x5ydcuCw8THX5+ttDp7uJ7+c/1a/H99I2prERTrJsp
	Uaz3O5QK8nvTPjBKL44ygj6q0OioxydzQoMEScpEufWOOXo8DZPJj8V+8oYUfwdQciBPPOUmpVF
	HwiQMDt9zwE4OyfdYA==
X-Received: by 2002:a05:6830:4486:b0:7d7:4cf3:76eb with SMTP id
 46e09a7af769-7d74cf37b02mr2194872a34.4.1773070309370; Mon, 09 Mar 2026
 08:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <202603090911.0DdOwjTR-lkp@intel.com>
In-Reply-To: <202603090911.0DdOwjTR-lkp@intel.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 9 Mar 2026 08:31:38 -0700
X-Gm-Features: AaiRm52Z14MD0OSGkRezE5rp23B4YvHF_3hxCrYP4X9p-5DR-qWhmespFt1uSGc
Message-ID: <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: kernel test robot <lkp@intel.com>
Cc: Sungwoo Kim <iam@sung-woo.kim>, Jens Axboe <axboe@kernel.dk>, 
	Josef Bacik <josef@toxicpanda.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
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

On Mon, Mar 9, 2026 at 1:42=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Sungwoo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on device-mapper-dm/for-next linus/master v6.16-rc=
1 next-20260306]
> [cannot apply to linux-nvme/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sungwoo-Kim/blk-mq=
-nvme-Fix-general-protection-fault-in-nvme_setup_descriptor_pools/20260309-=
143107
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git f=
or-next
> patch link:    https://lore.kernel.org/r/20260309062840.2937858-2-iam%40s=
ung-woo.kim
> patch subject: [PATCH] blk-mq: nvme: Fix general protection fault in nvme=
_setup_descriptor_pools()
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/202=
60309/202603090911.0DdOwjTR-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260309/202603090911.0DdOwjTR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603090911.0DdOwjTR-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error[E0308]: mismatched types
>    --> rust/kernel/block/mq/operations.rs:274:28
>    |
>    274 |         init_request: Some(Self::init_request_callback),
>    |                       ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn p=
ointer, found fn item
>    |                       |
>    |                       arguments to this enum variant are incorrect
>    |
>    =3D note: expected fn pointer `unsafe extern "C" fn(_, _, _, i32) -> _=
`
>    found fn item `unsafe extern "C" fn(_, _, _, u32) -> _ {block::mq::ope=
rations::OperationsVTable::<T>::init_request_callback}`
>    help: the type constructed contains `unsafe extern "C" fn(*mut binding=
s::blk_mq_tag_set, *mut bindings::request, u32, u32) -> i32 {block::mq::ope=
rations::OperationsVTable::<T>::init_request_callback}` due to the type of =
the argument passed

Looks like the type of _numa_node in the signature of
init_request_callback() needs to be updated accordingly from c_uint to
c_int.

Best,
Caleb


>    --> rust/kernel/block/mq/operations.rs:274:23
>    |
>    274 |         init_request: Some(Self::init_request_callback),
>    |                       ^^^^^---------------------------^
>    |                            |
>    |                            this argument influences the type of `Som=
e`
>    note: tuple variant defined here
>    --> /opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x8=
6_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:597:=
5
>    |
>    597 |     Some(#[stable(feature =3D "rust1", since =3D "1.0.0")] T),
>    |     ^^^^
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
