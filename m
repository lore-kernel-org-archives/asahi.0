Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DFEC5
	for <asahi@lists.linux.dev>; Wed,  5 Apr 2023 11:23:01 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-502208f7cb3so51223a12.0
        for <asahi@lists.linux.dev>; Wed, 05 Apr 2023 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680693779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AIDpAXeql8fQFsGeJuksLHT5Tjntg1bMf3SzmtbVWuw=;
        b=IzUuFtORfMloOmhavJNJm9+NYqNJWfWN3eSrH31qlNxLnm25lvYHZ2fIb6dJnqSka+
         SpBIB8riody8aUQPvt3fp0ovl1FfSifeegOtFVTa6GHoWCHb6Quy+A+EN1KmxTZzYS9u
         ybpg5VvnxOECq8NHuR8NC19mUO9NNjdIsenCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680693779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIDpAXeql8fQFsGeJuksLHT5Tjntg1bMf3SzmtbVWuw=;
        b=MDgUNHNJ1vsYoCKQP20oBA4amdiO+r4DnpkpH5QeQK+kqAGZ/NFxNC9X8LAPCI/pca
         Ddw/Tyw5GB21YgCKUvU+Xbld9fp997p4V4yzS4eDmBzkmjmwTbn8YaR9roWqLClxc5sE
         oZUic35kbpU+HBGCOUUwcuqsXHMgatpDZBvb3Y4Eb8YpbnTSeK7x4LNiL8ZwpStUxMze
         B9GrqP6qOfaKORfVnVLgwtVD9C6dD9hX6C571fokm9QSSA9B0C0QaWLe6jXP6bla9AkD
         +2boz2JOLcDCdoAxJXp6Flfn2HEiNr3bxgTzZhj5LBQkmIcwHlO6CxkZdh2gAq/w9nIo
         f4GA==
X-Gm-Message-State: AAQBX9f9qz55oA83W8hOFPIe++GW57IlMaNM4p+zio/AvZ5/qnnybHwn
	oyawIcrSOx0Kr3a5K2VcRbSwVQ==
X-Google-Smtp-Source: AKy350YDzxjFtsEmZYUsxOHSYuXCTDzqNZtYc94nVGRrMWnan5/9qyZpfua6PXz/dekKVYvqi2sjiQ==
X-Received: by 2002:a17:906:2219:b0:92f:39d9:1e50 with SMTP id s25-20020a170906221900b0092f39d91e50mr1509304ejs.3.1680693779731;
        Wed, 05 Apr 2023 04:22:59 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id ke4-20020a17090798e400b009327ed171f2sm7186340ejc.129.2023.04.05.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:22:59 -0700 (PDT)
Date: Wed, 5 Apr 2023 13:22:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Asahi Lina <lina@asahilina.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Karol Herbst <kherbst@redhat.com>,
	Ella Stanforth <ella@iglunix.org>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-sgx@vger.kernel.org, asahi@lists.linux.dev,
	Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC 04/18] rust: drm: gem: Add GEM object abstraction
Message-ID: <ZC1aEZpgZLkq8xTv@phenom.ffwll.local>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Asahi Lina <lina@asahilina.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Karol Herbst <kherbst@redhat.com>,
	Ella Stanforth <ella@iglunix.org>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-4-917ff5bc80a8@asahilina.net>
 <ZC1WwJDr1iqSQnYs@phenom.ffwll.local>
 <CANiq72=h9qKrpkY2K962__rs-JLsmWxPXocx040ZeDSKGf_Brw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=h9qKrpkY2K962__rs-JLsmWxPXocx040ZeDSKGf_Brw@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 

On Wed, Apr 05, 2023 at 01:19:47PM +0200, Miguel Ojeda wrote:
> On Wed, Apr 5, 2023 at 1:08 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Uh all the rust helper wrappers for all the kernel in a single file does
> > not sound good. Can we not split these up into each subsystem, and then
> > maybe instead of sprinkling #ifdef all over a .c file Make the compilation
> > of that file conditional on rust support (plus whatever other Kconfig gate
> > the other c files has already)?
> 
> Indeed, the plan is splitting the `kernel` crate and giving each
> subsystem its own crate, bindings, helpers, etc.

Ok if this is just interim I think it's fine. Would still be good to have
the MAINTAINERS entry though even just to cover the interim state. Least
because I'm assuming that when things are split up you'd still want to
keep the rust list on cc for the rust parts, even when they move into
subsystems?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
