Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5A515A5
	for <asahi@lists.linux.dev>; Sat, 25 Feb 2023 02:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D0BDA3FA55;
	Sat, 25 Feb 2023 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1677292278;
	bh=d7fNCc0OXWajjux2XtUPq9jeuVNkW9eE2qqP/QqkV9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=uPuxPeuIMiA3/pG9mj3tq26RVvZw6XOx+p/mf8zoWUVGDBwu4NuCCGJlwIwCA+Aqb
	 5hTGTj03EMoKTJs+MDUB4YVbPrae9yJwWfXqLUXBaypapt72p5m6iSxmZi3UcN9O4r
	 J+c8cN38Xhucb/ylLRmPjpFVBhBBjcXMOb57ga7qQDBaDbfKEjQ5Yr2CQqgl7sYEcy
	 ag0NGLoGcDUSycEFwkHXW700FsN8oIsE+zlxCClxZz1161YitPnRTJWmCFg7jneFko
	 TXmsSCVISszbOsY5yZPEPPa2Ca7rx5LQgaeMlqAD/YQGz7cVVhx2KkB3v5y+Rax6EW
	 4l2E2Td0duvrA==
Message-ID: <18fb86aa-4c63-d455-4bee-ff6fcf95f8a4@asahilina.net>
Date: Sat, 25 Feb 2023 11:31:13 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] rust: error: Add from_kernel_result!() macro
Content-Language: en-US
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-5-f8f9a9a87303@asahilina.net>
 <Y/lOlcSpc+d9ytq/@boqun-archlinux>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <Y/lOlcSpc+d9ytq/@boqun-archlinux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2023 08.56, Boqun Feng wrote:
> On Fri, Feb 24, 2023 at 05:50:23PM +0900, Asahi Lina wrote:
>> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>>
>> Add a helper macro to easily return C result codes from a Rust function
>> that calls functions which return a Result<T>.
>>
>> Lina: Imported from rust-for-linux/rust, originally developed by Wedson
>> as part of file_operations.rs. Added the allow() flags since there is no
>> user in the kernel crate yet and fixed a typo in a comment.
>>
>> Co-developed-by: Fox Chen <foxhlchen@gmail.com>
>> Signed-off-by: Fox Chen <foxhlchen@gmail.com>
>> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>>  rust/kernel/error.rs | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>
>> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
>> index cf3d089477d2..8a9222595cd1 100644
>> --- a/rust/kernel/error.rs
>> +++ b/rust/kernel/error.rs
>> @@ -226,3 +226,55 @@ pub(crate) fn from_kernel_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
>>      }
>>      Ok(ptr)
>>  }
>> +
>> +// TODO: Remove `dead_code` marker once an in-kernel client is available.
>> +#[allow(dead_code)]
>> +pub(crate) fn from_kernel_result_helper<T>(r: Result<T>) -> T
>> +where
>> +    T: From<i16>,
>> +{
>> +    match r {
>> +        Ok(v) => v,
>> +        // NO-OVERFLOW: negative `errno`s are no smaller than `-bindings::MAX_ERRNO`,
>> +        // `-bindings::MAX_ERRNO` fits in an `i16` as per invariant above,
>> +        // therefore a negative `errno` always fits in an `i16` and will not overflow.
>> +        Err(e) => T::from(e.to_kernel_errno() as i16),
>> +    }
>> +}
>> +
>> +/// Transforms a [`crate::error::Result<T>`] to a kernel C integer result.
>> +///
>> +/// This is useful when calling Rust functions that return [`crate::error::Result<T>`]
>> +/// from inside `extern "C"` functions that need to return an integer
>> +/// error result.
>> +///
>> +/// `T` should be convertible from an `i16` via `From<i16>`.
>> +///
>> +/// # Examples
>> +///
>> +/// ```ignore
>> +/// # use kernel::from_kernel_result;
>> +/// # use kernel::bindings;
>> +/// unsafe extern "C" fn probe_callback(
>> +///     pdev: *mut bindings::platform_device,
>> +/// ) -> core::ffi::c_int {
>> +///     from_kernel_result! {
>> +///         let ptr = devm_alloc(pdev)?;
>> +///         bindings::platform_set_drvdata(pdev, ptr);
>> +///         Ok(0)
>> +///     }
>> +/// }
>> +/// ```
>> +// TODO: Remove `unused_macros` marker once an in-kernel client is available.
>> +#[allow(unused_macros)]
>> +macro_rules! from_kernel_result {
> 
> This actually doesn't need to be a macro, right? The following function
> version:
> 
> 	pub fn from_kernel_result<T, F>(f: F) -> T
> 	where
> 	    T: From<i16>,
> 	    F: FnOnce() -> Result<T>;
> 
> is not bad, the above case then can be written as:
> 
> 	unsafe extern "C" fn probe_callback(
> 	    pdev: *mut bindings::platform_device,
> 	) -> core::ffi::c_int {
> 	    from_kernel_result(|| {
> 		let ptr = devm_alloc(pdev)?;
> 		bindings::platform_set_drvdata(pdev, ptr);
> 		Ok(0)
> 	    })
> 	}
> 
> less magical, but the control flow is more clear.
> 
> Thoughts?

Looks good to me! I guess the macro was mostly to hide and call the
closure, but it's not really necessary. I'll change it ^^

~~ Lina
