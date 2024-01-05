Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99123609A
	for <asahi@lists.linux.dev>; Fri,  5 Jan 2024 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ccbded5aa4so459771fa.1
        for <asahi@lists.linux.dev>; Fri, 05 Jan 2024 15:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704496260; x=1705101060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnW9mWezJzFnoOsXXfsEni1zeHgLaEiPfA2rSuqqDm4=;
        b=apjyUgoupThv+WAl8hyotIOd23QQbAgamDggR33UTWRdLPTMQWZDY3lY+r9Nudxhv4
         L2fb91ygYAwF2Vn58yOJMxLlkm0A4VaPkAkgJxTxW92pPZrygNRN1MGrLbM2KmJGDhbK
         METRTMm2J/Ty48oT06w4Prrj2stPQxzmGqnLHgIx4kVvQ0IPTs0ebvQCV0zw4qy2HQiD
         anIoajtH5e61eOckZJ4W9uhWOz5a2ztzihkEbJXbcnB5jm4ObPFim3ycdfOPdSm0I/N8
         QEn8BcR280C6wgMT4cyh3254zQHfbfO+wHwHHZnCG6NQTzD0CILGRNvIJdl2p+LT5l9D
         aSgw==
X-Gm-Message-State: AOJu0YzfN+A4fy24L1ZN2d8owPYipixJVqzRIPgTYb7zVTzNRhp/yMOP
	FBlYCSG8IwUxmfy2OmN5ZsSvvUNaCb0u3Q==
X-Google-Smtp-Source: AGHT+IGiGmdS9I2hSxWydnHVL6x8kv0+nkM0IDBufY0maHKaAP5Dwp/iuAcHAw6FN0y9Zdt2isI8WA==
X-Received: by 2002:a2e:be93:0:b0:2cd:936:8b68 with SMTP id a19-20020a2ebe93000000b002cd09368b68mr65779ljr.56.1704496260134;
        Fri, 05 Jan 2024 15:11:00 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id b5-20020a50ccc5000000b0055504002a5fsm1478784edj.72.2024.01.05.15.10.58
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 15:10:58 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-556c60c3f9aso69914a12.3
        for <asahi@lists.linux.dev>; Fri, 05 Jan 2024 15:10:58 -0800 (PST)
X-Received: by 2002:a17:906:6893:b0:a26:bd81:2cfb with SMTP id
 n19-20020a170906689300b00a26bd812cfbmr55245ejr.59.1704496258172; Fri, 05 Jan
 2024 15:10:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231116160235.2708131-1-neal@gompa.dev> <20231213222529.GF3001@twin.jikos.cz>
In-Reply-To: <20231213222529.GF3001@twin.jikos.cz>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 5 Jan 2024 18:10:21 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9dqzz++FhTBA7ju_NV+3ZYBbC4KBDDwmz1hBgJyiUiSQ@mail.gmail.com>
Message-ID: <CAEg-Je9dqzz++FhTBA7ju_NV+3ZYBbC4KBDDwmz1hBgJyiUiSQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] Enforce 4k sectorize by default for mkfs
To: dsterba@suse.cz
Cc: Linux BTRFS Development <linux-btrfs@vger.kernel.org>, Anand Jain <anand.jain@oracle.com>, 
	Qu Wenruo <quwenruo.btrfs@gmx.com>, Qu Wenruo <wqu@suse.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Davide Cavalca <davide@cavalca.name>, Jens Axboe <axboe@fb.com>, 
	Asahi Lina <lina@asahilina.net>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 5:32=E2=80=AFPM David Sterba <dsterba@suse.cz> wrot=
e:
>
> On Thu, Nov 16, 2023 at 11:02:23AM -0500, Neal Gompa wrote:
> > The Fedora Asahi SIG[0] is working on bringing up support for
> > Apple Silicon Macintosh computers through the Fedora Asahi Remix[1].
> >
> > Apple Silicon Macs are unusual in that they currently require 16k
> > page sizes, which means that the current default for mkfs.btrfs(8)
> > makes a filesystem that is unreadable on x86 PCs and most other ARM
> > PCs.
> >
> > This is now even more of a problem within Apple Silicon Macs as it is n=
ow
> > possible to nest 4K Fedora Linux VMs on 16K Fedora Asahi Remix machines=
 to
> > enable performant x86 emulation[2] and the host storage needs to be com=
patible
> > for both environments.
> >
> > Thus, I'd like to see us finally make the switchover to 4k sectorsize
> > for new filesystems by default, regardless of page size.
> >
> > The initial test run by Hector Martin[3] at request of Qu Wenruo
> > looked promising[4], and we've been running with this behavior on
> > Fedora Linux since Fedora Linux 36 (at around 6.2) with no issues.
> >
> > =3D=3D=3D Changelog =3D=3D=3D
> >
> > v4: Fixed minor errors in the cover letter and patch subject
> >
> > v3: Refreshed cover letter, rebased to latest, updated doc references f=
or v6.7
> >
> > v2: Rebased to latest, updated doc references for v6.6
> >
> > Final v1: Collected Reviewed-by tags for inclusion.
> >
> > RFC v2: Addressed documentation feedback
> >
> > RFC v1: Initial submission
> >
> > [0]: https://fedoraproject.org/wiki/SIGs/Asahi
> > [1]: https://fedora-asahi-remix.org/
> > [2]: https://sinrega.org/2023-10-06-using-microvms-for-gaming-on-fedora=
-asahi/
> > [3]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9cec=
a20263@suse.com/T/#m11d7939de96c43b3a7cdabc7c568d8bcafc7ca83
> > [4]: https://lore.kernel.org/linux-btrfs/fdffeecd-964f-0c69-f869-eb9cec=
a20263@suse.com/T/#mf382b78a8122b0cb82147a536c85b6a9098a2895
> >
> > Neal Gompa (1):
> >   btrfs-progs: mkfs: Enforce 4k sectorsize by default
>
> FYI, current plan is to add the change to 6.7 release with ETA in
> January. We've discussed this and given the increasing demand for that
> from various distros and testing coverage so done far it seems that it's
> sufficient.
>

Is this queued yet for the btrfs-progs v6.7 release? I don't see it in
your devel tree[1] yet...

[1]: https://github.com/kdave/btrfs-progs/commits/devel/


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
