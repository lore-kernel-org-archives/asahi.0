Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8BF3A6EF8
	for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745099; cv=none; b=kS0kARwHdMgqFEbDzX8e9E+UqJWIlo+bTgBjX30rDayqsUjCL/kq6n68FSb4nkZOuzPv9ujcHm3Kxon697ANjdQKqt/7ZxCkcCBgSCLtnvwWkjGeRGyJ0YweMexQkJ7B+gKDHUsreePuB+tq3QbDI5+S9cbEkKQdK17ULb0hrIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745099; c=relaxed/simple;
	bh=joGJmAWA0eGhDv45V0acMmM+Twim6ySRxLxTwCpiu+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apfV61XDckKKuJ7ef7I0WEIWWlVG69DInKHbaMhjnnYGU5Pz4NsAm+fr8ZKgukKchP8WSLDmjL1YiLy+Oygbgsi7o5dGLvaqEIGAfunbYrMumo267mDuXx0kKAF4qshlWS2Z114wmCiANhK5M8qvy+4kC5e9Y48zPEVotfRmE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaTmRtu7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaTmRtu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0494BC2BCB4
	for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 10:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773745099;
	bh=joGJmAWA0eGhDv45V0acMmM+Twim6ySRxLxTwCpiu+k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=TaTmRtu7yKzwUhZSOEp60W/UekoLdCwYKvA5GiKu6sWo3g8R5e7B9xEevnqsA9Y6K
	 4E8Ba6mGE4Al7Ui7sD6+LbqUxjcjkcNKyip8IJecfmg2LgDtFc2GNJwmK7KT5ZF3uu
	 YLDDAZ1+wp1uNEUFanbGbX2RwxmZUga3MiSwcgv3d+alXXxaLCF0nU3C0mAzFaf2JL
	 5fx+wK3dTD1C/lGoyv8e8BD4XsE6GPeYXh9D3wzD9wbXLfO9acm5kMearjvxs+gB83
	 5ZM3fdQr/wjrJdhD0mZ7z3bP/NakOawlr8UDa/y5djmVpcvySI09w/OscknKYJkuy8
	 GL7QkIlNlzciA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so5712621fa.1
        for <asahi@lists.linux.dev>; Tue, 17 Mar 2026 03:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6JLInnSjc6jHtsY6p/IRlQjTu7vFENVsoMQgXd0E7y9nWAM3lpDaqR1U2vU5VmNBUWaux6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDZ1ZcRLGWL+DIJuX9w8EXcEByhdKaeZiofbOo4nRULCFKgpbw
	Ft28tVG97EuNgNvBYM4MyCOtUINHtq5Ng6LVGAgYN72dDDCV6NQjCNpydU/H86OFogMBGPSunzE
	MLes5Gu3fhvtgeAsud3LuJKB/hrc+mDc=
X-Received: by 2002:a05:651c:f04:b0:387:b72:816a with SMTP id
 38308e7fff4ca-38ace817266mr9712241fa.3.1773745097248; Tue, 17 Mar 2026
 03:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317064049.696795-1-wenst@chromium.org> <20260317064049.696795-3-wenst@chromium.org>
 <607daaca-79ed-45b2-941e-1680a17618e8@suse.de>
In-Reply-To: <607daaca-79ed-45b2-941e-1680a17618e8@suse.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Mar 2026 18:58:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v66D3=s9c8oJyYEAK90A4SekW6FjLUpWBGRHnJwtfMvUeg@mail.gmail.com>
X-Gm-Features: AaiRm51eS0mRfq2Cbo6u_Rt7Bxck_f3oX14wByjZaXlGaiH47T5oEGbz3iu-Y5Y
Message-ID: <CAGb2v66D3=s9c8oJyYEAK90A4SekW6FjLUpWBGRHnJwtfMvUeg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 4:12=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 17.03.26 um 07:40 schrieb Chen-Yu Tsai:
> > From: Rob Herring <robh@kernel.org>
> >
> > Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
> > drm_mode_create_dumb. This flag is for internal kernel use to indicate
> > if dumb buffer allocation needs a kernel mapping. This is needed only f=
or
> > CMA where creating a kernel mapping or not has to be decided at allocat=
ion
> > time because creating a mapping on demand (with vmap()) is not guarante=
ed
> > to work. Several drivers are using CMA, but not the CMA helpers because
> > they distinguish between kernel and userspace allocations to create a
> > kernel mapping or not.
>
> Any dumb allocation might require vmap. This is not limited to internal
> buffers.  Because if the dumb buffer is shared with another driver, that
> driver might require the vmap for displaying the buffer content. There
> are enough of such drivers.

By sharing, do you mean exported via PRIME then imported by another device?
Or just passing around GEM objects within the kernel?

And could you provide an example?

> > Update the callers of drm_mode_dumb_create() to set
> > drm_mode_dumb_create.flags to appropriate defaults. Currently, flags ca=
n
> > be set to anything by userspace, but is unused within the kernel. Let's
> > force flags to zero (no kernel mapping) for userspace callers by defaul=
t.
> > For in kernel clients, set DRM_MODE_DUMB_KERNEL_MAP by default. Drivers
> > can override this as needed.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > [wenst@chromium.org: Emit warning if args->flags is not zero]
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Emit warning if args->flags is not zero
> > ---
> >   drivers/gpu/drm/drm_client.c       | 1 +
> >   drivers/gpu/drm/drm_dumb_buffers.c | 4 ++++
> >   include/uapi/drm/drm_mode.h        | 2 ++
> >   3 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.=
c
> > index 46c465bce98c..1a57e7eadc0f 100644
> > --- a/drivers/gpu/drm/drm_client.c
> > +++ b/drivers/gpu/drm/drm_client.c
> > @@ -404,6 +404,7 @@ drm_client_buffer_create_dumb(struct drm_client_dev=
 *client, u32 width, u32 heig
> >       dumb_args.width =3D width;
> >       dumb_args.height =3D height;
> >       dumb_args.bpp =3D drm_format_info_bpp(info, 0);
> > +     dumb_args.flags =3D DRM_MODE_DUMB_KERNEL_MAP;
> >       ret =3D drm_mode_create_dumb(dev, &dumb_args, client->file);
> >       if (ret)
> >               return ERR_PTR(ret);
> > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_d=
umb_buffers.c
> > index e2b62e5fb891..ccdcc401d4dc 100644
> > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > @@ -233,6 +233,10 @@ int drm_mode_create_dumb_ioctl(struct drm_device *=
dev,
> >       struct drm_mode_create_dumb *args =3D data;
> >       int err;
> >
> > +     if (args->flags)
> > +             drm_warn(dev, "drm_mode_create_dumb.flags is not zero.\n"=
);
>
> At most use drm_warn_once() to not let this spam the kernel log.

Sure.

> > +     args->flags =3D 0;
> > +
> >       err =3D drm_mode_create_dumb(dev, args, file_priv);
> >       if (err) {
> >               args->handle =3D 0;
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index 3693d82b5279..7d5f50e4af70 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1272,6 +1272,8 @@ struct drm_mode_create_dumb {
> >       __u64 size;
> >   };
> >
> > +#define DRM_MODE_DUMB_KERNEL_MAP     (1<<0)  /* For internal kernel us=
e */
> > +
>
> If this is an internal flag, it should not live in the UAPI header.
> include/drm/drm_dumb_buffers.h would be a good place.

Makes sense.


Thanks
ChenYu

> Best regards
> Thomas
>
> >   /* set up for mmap of a dumb scanout buffer */
> >   struct drm_mode_map_dumb {
> >       /** Handle for the object being mapped. */
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG N=C3=
=BCrnberg)
>
>
