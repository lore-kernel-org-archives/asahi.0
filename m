Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E22F3A
	for <asahi@lists.linux.dev>; Thu,  6 Apr 2023 22:51:48 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-930129be52dso144144266b.1
        for <asahi@lists.linux.dev>; Thu, 06 Apr 2023 15:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680821505; x=1683413505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/Yq+RogF4NLB0ytnE2c8qbIFYDpm8Av/BOMlLi7ICo=;
        b=shwfOxB4ykBByPckJKUD42GJE6sDWfoeSa28AMr8d21fTTkETD3cmlthc4C7HgTkIJ
         wsdeBg9rwdJTEPIg4lmcuKxyZ1BWdHZgjFcec1zyJRF3xdQpVp/xBR8U3b58yAEj+RSo
         Ebu4MkCitEqkLUJmhHcaPBqeHzfcCcdZzKq92riDPrpy/uKNOftS9LjT3cp3i6vdbI1o
         YwElxSPY8pqS1XIjxK1RNUXizax+DvMa4Ipc36nQhI+kKwwgmEH2rU5NnCHnHLPOLRvR
         doKPPI3sqe2cV1z0BFBXDaNTWruy87jRMX75AgWaH3aMqHK9BUs+cPQYGB7DF7x+sEkI
         /EyQ==
X-Gm-Message-State: AAQBX9cXgYvXNeM5kp4KLiVOzFjksbD9IStxgV2twcR6CIeJCBItJRbt
	3cmzY058Ah0tZE1JgmLJU/Wnh2Q2VOsouzG5
X-Google-Smtp-Source: AKy350ZkwX+QQivNa1FwJK7t4LWfEaGCYc64E8nG98xW1pRLdG4phRvV7Pela0SEGUVhZ+vC+l7J+g==
X-Received: by 2002:aa7:d906:0:b0:504:6437:4369 with SMTP id a6-20020aa7d906000000b0050464374369mr782912edr.40.1680821505547;
        Thu, 06 Apr 2023 15:51:45 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id d20-20020a50cd54000000b005027dd7c403sm1248954edj.66.2023.04.06.15.51.43
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 15:51:45 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id l17so4843369ejp.8
        for <asahi@lists.linux.dev>; Thu, 06 Apr 2023 15:51:43 -0700 (PDT)
X-Received: by 2002:a17:907:7b81:b0:949:d4ef:f6ff with SMTP id
 ne1-20020a1709077b8100b00949d4eff6ffmr70090ejc.0.1680821503642; Thu, 06 Apr
 2023 15:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230322221714.2702819-1-neal@gompa.dev> <20230322221714.2702819-2-neal@gompa.dev>
 <ce66a6b0-01e2-990a-326a-9730083a436e@oracle.com>
In-Reply-To: <ce66a6b0-01e2-990a-326a-9730083a436e@oracle.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 6 Apr 2023 18:51:07 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9tccy8Xs=MzrfVRPiy667uv+BXoJVAPZLPvFELT_Vy6g@mail.gmail.com>
Message-ID: <CAEg-Je9tccy8Xs=MzrfVRPiy667uv+BXoJVAPZLPvFELT_Vy6g@mail.gmail.com>
Subject: Re: [PATCH 1/1] btrfs-progs: mkfs: Enforce 4k sectorsize by default
To: Anand Jain <anand.jain@oracle.com>
Cc: Linux BTRFS Development <linux-btrfs@vger.kernel.org>, Qu Wenruo <wqu@suse.com>, 
	David Sterba <dsterba@suse.cz>, Qu Wenruo <quwenruo.btrfs@gmx.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Davide Cavalca <davide@cavalca.name>, Jens Axboe <axboe@fb.com>, Asahi Lina <lina@asahilina.net>, 
	Asahi Linux <asahi@lists.linux.dev>, Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 1:31=E2=80=AFAM Anand Jain <anand.jain@oracle.com> w=
rote:
>
>
> [ fixed table format ]
>
> Comparing btrfs sectorsize=3D64K with sectorsize=3D4K on an aarch64
> virtual host with PAGESIZE=3D64k shows that switching to sectorsize
> (ss) =3D4K by default for buffered IO has a low impact, while the
> direct IO performance is improved by roughly 21% to 152% for
> various fio block sizes as shown below.
>
>
> aarch64 PAGESIZE=3D64K
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Buffered IO:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> FIO bs  ss=3D64k ss=3D4k   diff
> K       MB/s   MB/s    %
> 4        752    755
> 8        783    832    +6
> 64      1066   1173    +10
> 128     1120   1098    +2
> 256     1112   1079    -3
>
>
> Dierct IO:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> FIO bs ss=3D64k  ss=3D4k  diff
> K      MB/s    MB/s   %
> 4       54      106   +96
> 8      107      270   +152
> 64     737      894   +21
> 128    862     1130   +31
> 256    846     1103   +30
>
>
> FIO config file:
>
> [global]
> directory=3D/mnt/scratch
> allrandrepeat=3D1
> readwrite=3Dreadwrite
> ioengine=3Dio_uring
> iodepth=3D256
> end_fsync=3D1
> fallocate=3Dnone
> group_reporting
> gtod_reduce=3D1
> numjobs=3D8
> size=3D10G
> stonewall
>
> [fio-direct-4k]
> direct=3D1 <-- changed as appropriate
> bs=3D4k    <---changed as appropriate
>

Well, it's nice to see that there are performance advantages to using
4k block sizes everywhere. :)

Can we get this committed to btrfs-progs then?



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
