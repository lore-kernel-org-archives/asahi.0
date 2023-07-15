Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDDD15CD
	for <asahi@lists.linux.dev>; Sat, 15 Jul 2023 10:00:46 +0000 (UTC)
Date: Sat, 15 Jul 2023 10:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1689415244; x=1689674444;
	bh=QnF59vl5+yCYRQpMrd2L/uF0PGzIplpwVi1jkdKlyBY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Q6UkrPgLIIJU7b8/F8r0FqjyX9koF7x8ThbaXuvrSa7L4b74Qox63R8l+kmRz1f/j
	 9+yOUhlEaqz4mkzyHnHVStt4Sakh07G3jaOIJ4FnNQRb5pLXdP8Wx2J6+CUnN5r8Xv
	 b1dvJYa0D1OWk7CmYnMXJUI1fbT6naJlSsTB2PJwNM9fSgTu+WOTyKHri8Huy2XAUy
	 L3becJS07dyXOF1lBcc2o1lDqFn1yTKJAuRN+ckEe5jI1X+EnRFl34xSGBB+rqRDLv
	 VH0lNDVEwwau/55u820bNeTME6csSA4DBU+wjnc9/LZj0C7WPIjEq6CxqW64iE9Pn3
	 sIVvdspHn0G3g==
To: Asahi Lina <lina@asahilina.net>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
Message-ID: <Fri3hO6JBOzZwR7YKGQqy8HYwzn_ciV2HgjLNm36zwf1p8BsWCSrecnz-00K2dsztvOI1c2PP7cd_Kh6xjFVjbsX6U7qAPqvsdsi7WaaVow=@proton.me>
In-Reply-To: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
References: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14.07.23 11:19, Asahi Lina wrote:
> Trivial implementation.
>=20
> Signed-off-by: Asahi Lina <lina@asahilina.net>

With a better commit message you can add

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

> ---
>   rust/kernel/str.rs | 6 ++++++
>   1 file changed, 6 insertions(+)
>=20
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index c9dd3bf59e34..a94e396d39e1 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -606,6 +606,12 @@ fn try_from(cstr: &'a CStr) -> Result<CString, Alloc=
Error> {
>       }
>   }
>=20
> +impl fmt::Debug for CString {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        fmt::Debug::fmt(&**self, f)
> +    }
> +}
> +
>   /// A convenience alias for [`core::format_args`].
>   #[macro_export]
>   macro_rules! fmt {
>=20
> ---
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> change-id: 20230714-cstring-debug-ca021fe0ad78
>=20
> Thank you,
> ~~ Lina
> 
